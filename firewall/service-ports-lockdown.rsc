##
## Script by Andre Ferreira
## Created: 2025-05-15
## Version: 1.0.1
## Tested on: RouterOS 7.18
##
##
## Quote
## "To govern is to foresee." — Émile de Girardin
##
##
## Purpose
## Disable unused firewall service ports and explicitly block rarely used transport protocols
## that are always enabled at the kernel level but not needed in typical environments.
##
## Assumptions
## 1. Default-deny firewall policy is preferred
##
## Copyright (c) 2025 Andre Ferreira
##
## This script is licensed under the GNU General Public License, version 3 (GPL-3.0).
## You can freely modify, distribute, and use this script, under the following conditions:
##
## 1. You must keep this copyright notice and the full text of the GPL license.
## 2. If you modify the script and distribute it, you must inform the original author of the changes made.
## 3. You may not use the script for proprietary purposes.
##
## For a copy of the GPL-3.0 license, visit: https://www.gnu.org/licenses/gpl-3.0.html
##

/ip firewall service-port disable ftp,tftp,sip,pptp,h323,rtsp,irc

/ip firewall filter add chain=input protocol=udp-lite action=drop comment="Drop UDPLite (always loaded by the system)"
/ip firewall filter add chain=input protocol=dccp action=drop comment="Drop DCCP (always loaded by the system)"
/ip firewall filter add chain=input protocol=sctp action=drop comment="Drop SCTP (always loaded by the system)"

/ip firewall filter add chain=forward protocol=udp-lite action=drop comment="Drop UDPLite (always loaded by the system)"
/ip firewall filter add chain=forward protocol=dccp action=drop comment="Drop DCCP (always loaded by the system)"
/ip firewall filter add chain=forward protocol=sctp action=drop comment="Drop SCTP (always loaded by the system)"
