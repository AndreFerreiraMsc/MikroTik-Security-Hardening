##
## Script by Andre Ferreira
## Created: 2025-05-20
## Version: 1.0.1
## Tested on: RouterOS 7.18
##
## Quote
## "Silence is golden, especially on noisy networks." — Unknown
##
## Purpose
## This user.js configuration is intended to significantly reduce Firefox’s network activity.
## It was designed for environments where network silence is preferred over convenience.
## It is especially useful when accessing sensitive environments—such as router maintenance consoles where unintended 
## browser traffic can trigger firewall alerts or policy violations (hint: and to test those)
##
## Scope & Usage Notes:
## - This file should be placed in the appropriate Firefox profile directory:
##   ~/.mozilla/firefox/<your-profile>/user.js
##   You can find your profile path by visiting 'about:profiles' in Firefox.
## - Restart Firefox after placing this file to apply the settings.
## - This configuration disables telemetry, speculative connections, Safe Browsing, Sync, and various auto-updates.
## - Note that disabling security features like Safe Browsing and updates can expose you to risk (if used for 
## general-purpose browsing).
##
## Assumptions:
## - You are familiar with Firefox’s profile system and understand the implications of modifying user.js.
## - Restoring default behavior requires manual removal of this file and/or restoring from backup. <----------- WARNING!
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

// Disable Telemetry and Data Reporting
user_pref("toolkit.telemetry.enabled", false);
user_pref("toolkit.telemetry.unified", false);
user_pref("toolkit.telemetry.server", "");
user_pref("toolkit.telemetry.archive.enabled", false);
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("datareporting.policy.dataSubmissionEnabled", false);

// Disable Experiments and Normandy
user_pref("experiments.activeExperiment", false);
user_pref("experiments.enabled", false);
user_pref("experiments.supported", false);
user_pref("app.shield.optoutstudies.enabled", false);
user_pref("app.normandy.enabled", false);
user_pref("app.normandy.api_url", "");

// Disable Pocket
user_pref("extensions.pocket.enabled", false);

// Disable Firefox Sync
user_pref("identity.fxaccounts.enabled", false);

// Disable Captive Portal Detection
user_pref("network.captive-portal-service.enabled", false);

// Disable DNS over HTTPS
user_pref("network.trr.mode", 5);

// Disable Safe Browsing (Google)
user_pref("browser.safebrowsing.phishing.enabled", false);
user_pref("browser.safebrowsing.malware.enabled", false);
user_pref("browser.safebrowsing.downloads.enabled", false);
user_pref("browser.safebrowsing.blockedURIs.enabled", false);
user_pref("browser.safebrowsing.provider.google.updateURL", "");
user_pref("browser.safebrowsing.provider.google.gethashURL", "");

// Disable Auto Updates (Browser and Add-ons)
user_pref("app.update.enabled", false);
user_pref("extensions.update.enabled", false);
user_pref("extensions.systemAddon.update.enabled", false);
user_pref("extensions.getAddons.showPane", false);
user_pref("extensions.getAddons.cache.enabled", false);

// Disable Speculative Connections
user_pref("network.http.speculative-parallel-limit", 0);
user_pref("browser.urlbar.speculativeConnect.enabled", false);

// Disable Prefetching
user_pref("network.prefetch-next", false);
user_pref("network.dns.disablePrefetch", true);
user_pref("network.dns.disablePrefetchFromHTTPS", true);
user_pref("network.predictor.enabled", false);
user_pref("network.predictor.enable-prefetch", false);

// Disable Activity Stream Content (new tab recommendations etc.)
user_pref("browser.newtabpage.activity-stream.feeds.section.topstories", false);
user_pref("browser.newtabpage.activity-stream.feeds.snippets", false);
user_pref("browser.newtabpage.activity-stream.feeds.topsites", false);
user_pref("browser.newtabpage.activity-stream.feeds.telemetry", false);
user_pref("browser.newtabpage.activity-stream.telemetry", false);
user_pref("browser.newtabpage.enabled", false);
user_pref("browser.newtab.url", "about:blank");

// Set blank homepage
user_pref("browser.startup.homepage", "about:blank");
user_pref("browser.startup.page", 0);

// Disable Push Notifications
user_pref("dom.push.enabled", false);

// Disable Geolocation
user_pref("geo.enabled", false);

// Disable WebRTC (to prevent potential IP leaks)
user_pref("media.peerconnection.enabled", false);

// Misc cleanup
user_pref("browser.ping-centre.telemetry", false);
user_pref("extensions.webextensions.restrictedDomains", "");
user_pref("browser.selfsupport.url", "");
user_pref("browser.aboutHomeSnippets.updateUrl", "");

// Optional: disable Mozilla domains ping
user_pref("browser.selfsupport.url", "");
user_pref("browser.aboutHomeSnippets.updateUrl", "");

// Optional: prevent DNS resolution for single word queries
user_pref("browser.urlbar.dnsResolveSingleWordsAfterSearch", 0);

// Optional: disable background tasks
user_pref("browser.tasks.enabled", false);

// Optional: disable Referer headers entirely
user_pref("network.http.sendRefererHeader", 0)

// Allow normal web browsing (keep this intact)
user_pref("network.proxy.type", 0);
