##
## Script by Andre Ferreira
## Created: 2025-05-22
## Version: 1.0.1
## Tested on: RouterOs 7.18
##
##
## Quote
## "The best way to protect your data is to control how it’s shared." – Unknown
#
## Purpose
## Disable automatic SMB and media sharing for Mikrotik USB conected devices.
## Prevent unintended file sharing
##
## Assumptions
## 1 - You do not use the Mikrotik USB(s) or you do not want to make them available to the network
##
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
## internet-block-schedule.r
## For a copy of the GPL-3.0 license, visit https://www.gnu.org/licenses/gpl-3.0.html.
##

/disk settings set auto-smb-sharing=no auto-media-sharing=no
