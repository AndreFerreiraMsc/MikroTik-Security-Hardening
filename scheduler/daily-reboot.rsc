##
## Script by Andre Ferreira
## Created: 2025-05-15
## Version: 1.0.1
## Tested on: RouterOs 7.18
##
##
## Quote
## "Every day is a new beginning. Take a deep breath, smile, and start again." — Unknown
##
##
## Purpose
## Schedule a daily reboot of the router to maintain optimal performance and stability.
##
## Assumptions
## 1. The reboot will occur at a low-traffic time to minimize disruption.
## 2. No critical processes are disrupted by the reboot.
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

/system scheduler add comment="Daily reboot" name="daily-reboot" start-date=may/16/2025 start-time=04:00:00 interval=1d on-event="/system reboot"
