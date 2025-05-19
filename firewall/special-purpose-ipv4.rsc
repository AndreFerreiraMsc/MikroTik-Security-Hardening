##
## Script by Andre Ferreira
## Created: 2025-05-19
## Version: 1.0.1
## Tested on: RouterOS 7.18
##
## Quote
## "A firewall is only as strong as its weakest rule." - Unknown
##
## Purpose
## Block all special-purpose IPv4 address ranges that should not appear on the public Internet (spoofing prevention).
## References: RFCs and https://www.iana.org/assignments/iana-ipv4-special-registry/iana-ipv4-special-registry.xhtml
##
## Assumptions
## 1. The router user has write permissions
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
##
## For a copy of the GPL-3.0 license, visit https://www.gnu.org/licenses/gpl-3.0.html
##

/ip firewall address-list
add address=0.0.0.0/8           comment="RFC 791,8190 - This network"                    list=not_in_internet
add address=10.0.0.0/8          comment="RFC 6890 - Private-Use"                         list=not_in_internet
add address=100.64.0.0/10       comment="RFC 6890 - Shared Address Space"                list=not_in_internet
add address=127.0.0.0/8         comment="RFC 1122,6890 - Loopback"                       list=not_in_internet
add address=169.254.0.0/16      comment="RFC 3927,6890 - Link-Local"                     list=not_in_internet
add address=172.16.0.0/12       comment="RFC 6890 - Private-Use"                         list=not_in_internet
add address=192.0.0.0/24        comment="RFC 6890 - IETF Protocol Assignments"           list=not_in_internet
add address=192.0.2.0/24        comment="RFC 5737,6890 - TEST-NET-1"                     list=not_in_internet
add address=192.31.196.0/24     comment="RFC 7535 - AS112-v4 Anycast"                    list=not_in_internet
add address=192.52.193.0/24     comment="RFC 7450 - AMT Anycast"                         list=not_in_internet
add address=192.88.99.0/24      comment="RFC 6890 - 6to4 Relay Anycast"                  list=not_in_internet
add address=192.168.0.0/16      comment="RFC 1918,6890 - Private-Use"                    list=not_in_internet
add address=192.175.48.0/24     comment="RFC 7534 - AS112 Service"                       list=not_in_internet
add address=198.18.0.0/15       comment="RFC 2544,6890 - Benchmarking"                   list=not_in_internet
add address=198.51.100.0/24     comment="RFC 5737,6890 - TEST-NET-2"                     list=not_in_internet
add address=203.0.113.0/24      comment="RFC 5737,6890 - TEST-NET-3"                     list=not_in_internet
add address=224.0.0.0/4         comment="RFC 5771 - Multicast"                           list=not_in_internet
add address=240.0.0.0/4         comment="RFC 6890 - Reserved for Future Use"             list=not_in_internet
add address=255.255.255.255/32  comment="RFC 919 - Limited Broadcast"                    list=not_in_internet


/ip firewall filter
add chain=input   src-address-list=not_in_internet action=drop comment="Drop spoofed source" log=yes \
  log-prefix="Spoofing"
add chain=forward src-address-list=not_in_internet action=drop comment="Drop spoofed source"  log=yes \
  log-prefix="Spoofing"

