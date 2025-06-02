##
## Script by Andre Ferreira
## Created: 2025-05-15
## Version: 1.0.1
## Tested on: RouterOs 7.18
##
##
## Quote
## "All of humanity's problems stem from man's inability to sit quietly in a room alone." - Blaise Pascal
#
## Purpose
## Night Block - automatically disables internet access overnight
##
## Assumptions
## 1 - A firewall filter rule named 'filtering-placeholder' exists as a marker
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

/system scheduler add comment="Block internet access from 11PM" name="block-internet" start-time=23:00:00 interval=1d  on-event="/ip firewall filter add chain=forward action=drop comment=night-block place-before=filtering-placeholder"   

/system scheduler add comment="Unblock internet access from 8AM" name="unblock-internet" start-time=08:00:00 interval=1d on-event="/ip firewall filter remove [find comment=night-block]"

