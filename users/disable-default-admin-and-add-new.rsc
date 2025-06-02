##
## Script by Andre Ferreira
## Created: 2025-06-02
## Version: 1.0.2
## Tested on: RouterOS 7.19
##
##
## Quote
## "Admin passwords are a key target for attackers and, due to operational challenges, are rarely managed to the level 
## that they should be." — David Higgins 
## https://www.intelligentciso.com/2019/05/02/world-password-day-industry-experts-offer-their-views/
##
##
## Purpose
## Create a new full admin user with restricted allowed IP range, disable the default 'admin', delete this script.
##
## Assumptions
## 1 - You have administrative access to the MikroTik device.
## 2 - You want to restrict router management access to (a) trusted subnet(s).
## 3 - Default 'full' user group exists with appropriate permissions
##
## Copyright (c) 2025 Andre Ferreira 
##
##
## This script is licensed under the GNU General Public License, version 3 (GPL-3.0).
## You can freely modify, distribute, and use this script, under the following conditions:
##
## 1. You must keep this copyright notice and the full text of the GPL license.
## 2. If you modify the script and distribute it, you must inform the original author of the changes made.
## 3. You may not use the script for proprietary purposes.
##
## For a copy of the GPL-3.0 license, visit https://www.gnu.org/licenses/gpl-3.0.html.
##

:local scriptName "New-admin"
:local scriptVersion "1.0.1"
:local scrNV "[$scriptName $scriptVersion]"

/log info "$scrNV - Init"

###############################################################################
## CONFIGURATION section
## All user-configurable parameters are defined here
###############################################################################
:local username "change-me"
:local password "change-me-to-better-than-123456"
:local allowedIPRange "192.168.0.0/16"
:local inactivityPolicy "logout"
:local inactivityTimeout 15m


###################################################
## VALIDATION SECTION
## Validates all configuration parameters before execution
################################################### 
:if ( ([:len $username] = 0) || $username = "admin" || ([:len [/user find where name=$username]] > 0) ) do={
    :error "Invalid username: Must be (1) Non-empty, (2) Not 'admin', (3) Unique"
}

:if ([:len $password] < 12) do={
    :error "Password must be >=12 characters. Aborted!"
}

# Inactivity policy validation
:if (($inactivityPolicy != "logout") && ($inactivityPolicy != "lockscreen") && ($inactivityPolicy != "none")) do={
    :error "Invalid inactivity policy. Must be 'logout', 'lockscreen', or 'none'"
}

:if ([:len $allowedIPRange] > 18 || [:pick $allowedIPRange 0 7] = "0.0.0.0") do={
    :error "Overly broad subnet detected: $allowedIPRange"
}

# Timeout validation
:if ([:typeof $inactivityTimeout] != "time" || $inactivityTimeout < 5m) do={
    :error "Invalid timeout. Must be time value ≥5m (e.g., '15m')"
}

# Group validation
:if ([:len [/user group find name="full"]] = 0) do={
    :error "Required user group 'full' does not exist. Aborted!"
}


###############################################################################
## Main section
## Where the magic happens
###############################################################################
/user add name=$username password=$password address=$allowedIPRange group=full comment="New Admin" disabled=no \
    inactivity-policy=$inactivityPolicy inactivity-timeout=$inactivityTimeout

# Disable default admin
:if ( ([/user find where name=$username] != "") && ([/user find where name="admin"] != "") ) do={
    :log warning "Disabling 'admin' in 5 minutes. Validate new account first!"

    :put "======================================================="
    :put "| ATTENTION: Try logging in NOW with user '$username'! |"
    :put "| The default 'admin' will be disabled in 5 minutes... |"
    :put "======================================================="

    /delay 5m
    
    /user set admin disabled=yes

} else={
    :error "Default admin user not disabled (user $username missing or admin does not exist)."
}

# Remove this script after execution
:local scriptName [:jobname]
:if ([:len [:find [/system script get $scriptName name] ".rsc"]] > 0) do={
    /system script remove [find name=scriptName]
    /log info ($scriptName . " deleted!")
}

/log info "$scrNV - completed"
