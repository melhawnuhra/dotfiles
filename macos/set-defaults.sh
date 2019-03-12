#!/bin/sh

# Sets reasonable macOS defaults.
# Or, in other words, set shit how I like in macOS.
#
# The original idea (and a couple settings) were grabbed from:
#   https://github.com/mathiasbynens/dotfiles/blob/master/.macos
#
# Run ./set-defaults.sh and you'll be good to go.

# Close any open System Preferences panes, to prevent them from overriding settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Remove duplicates in the “Open With” menu
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user

echo "--> Apply system and application defaults..."

# System {{{
echo "System - Disable the 'Are you sure you want to open this application?' dialog"
defaults write com.apple.LaunchServices LSQuarantine -bool false

echo "System - Disable auto-correct"
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

echo "System - Avoid creating .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

echo "System - Set standby delay to 24 hours (default is 1 hour)"
sudo pmset -a standbydelay 86400

echo "System - Disable hibernation (speeds up entering sleep mode)"
sudo pmset -a hibernatemode 0

echo "System - Restart automatically if the computer freezes"
sudo systemsetup -setrestartfreeze on

echo "System - Never go into computer sleep mode"
sudo systemsetup -setcomputersleep Off > /dev/null

echo "System - Disable Resume system-wide"
defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false

echo "System - Disable automatic termination of inactive apps"
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

echo "System - Disable sudden motion sensor. (Not useful for SSDs)."
sudo pmset -a sms 0

echo "System - Display ASCII control characters using caret notation in standard text views"
# Try e.g. `cd /tmp; unidecode "\x{0000}" > cc.txt; open -e cc.txt`
defaults write NSGlobalDomain NSTextShowsControlCharacters -bool true

echo "System - Reveal IP address, hostname, OS version, etc. when clicking the clock in the login window"
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

echo "System - Use Cloudflare DNS globally"
bash ./use_cloudflare_dns.sh

echo "System - Use AirDrop over every interface. srsly this should be a default."
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1
# }}}

# Screen {{{
# Enable subpixel font rendering on non-Apple LCDs
# Reference: https://github.com/kevinSuttle/macOS-Defaults/issues/17#issuecomment-266633501
defaults write NSGlobalDomain AppleFontSmoothing -int 1

# Enable HiDPI display modes (requires restart)
sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true
# }}}

# Screenshots {{{
echo "Screenshots - Save to desktop"
defaults write com.apple.screencapture location -string "${HOME}/Desktop"

echo "Screenshots - Save in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)"
defaults write com.apple.screencapture type -string "png"

echo "Screenshots - Disable shadows"
defaults write com.apple.screencapture disable-shadow -bool true
# }}}

# Security {{{
echo "Security - Require password immediately after sleep or screen saver begins"
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

echo "Security - Disable captive portal hijacking attack"
defaults write /Library/Preferences/SystemConfiguration/com.apple.captive.control Active -bool false

echo "Security - Don't respond to ICMP pings and TCP/UDP requests on closed ports"
defaults write /Library/Preferences/com.apple.alf stealthenabled -bool true
# }}}

# Keyboard {{{
echo "Keyboard - Enable keyboard access for all controls"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

echo "Keyboard - Disable press-and-hold for keys in favor of key repeat."
defaults write -g ApplePressAndHoldEnabled -bool false

echo "Keyboard - Set a really fast key repeat"
defaults write NSGlobalDomain KeyRepeat -int 1

echo "Keyboard - Disable automatic capitalization as it’s annoying when typing code"
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

echo "Keyboard - Disable smart dashes as they’re annoying when typing code"
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

echo "Keyboard - Disable automatic period substitution as it’s annoying when typing code"
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

echo "Keyboard - Disable smart quotes as they’re annoying when typing code"
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

echo "Keyboard - Disable auto-correct"
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
# }}}

# Trackpad {{{
echo "Trackpad - Enable tap to click for current user and the login screen"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

echo "Trackpad - Don't reverse scroll direction"
defaults write -g com.apple.swipescrolldirection -bool false
# }}}

# Sound {{{
echo "Sound - Disable the sound effects on boot"
sudo nvram SystemAudioVolume=" "

echo "Sound - Increase sound quality for bluetooth headphones/headsets"
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40
# }}}

# Dock {{{
echo "Dock - Automatically hide and show"
defaults write com.apple.dock autohide -bool true

echo "Dock - Remove the auto-hiding delay"
defaults write com.apple.Dock autohide-delay -float 0

echo "Dock - Don’t show Dashboard as a Space"
defaults write com.apple.dock "dashboard-in-overlay" -bool true

echo "Dock - Use the dark theme"
defaults write ~/Library/Preferences/.GlobalPreferences AppleInterfaceStyle -string "Dark"

echo "Dock - Enable highlight hover effect for the grid view of a stack (Dock)"
defaults write com.apple.dock mouse-over-hilite-stack -bool true

echo "Dock - Set the icon size of Dock items to 44 pixels"
defaults write com.apple.dock tilesize -int 56

echo "Dock - Enable spring loading for all Dock items"
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

echo "Dock - Show indicator lights for open applications in the Dock"
defaults write com.apple.dock show-process-indicators -bool true

# echo "Dock - Show only open applications in the Dock"
# defaults write com.apple.dock static-only -bool true

echo "Dock - Don’t animate opening applications from the Dock"
defaults write com.apple.dock launchanim -bool false

echo "Dock - Remove the animation when hiding/showing the Dock"
defaults write com.apple.dock autohide-time-modifier -float 0

echo "Make Dock icons of hidden applications translucent"
defaults write com.apple.dock showhidden -bool true

echo "Don’t show recent applications in Dock"
defaults write com.apple.dock show-recents -bool false

# Wipe all (default) app icons from the Dock
# This is only really useful when setting up a new Mac, or if you don’t use the Dock to launch apps.
# defaults write com.apple.dock persistent-apps -array
# }}}

# Time Machine {{{
echo "Time Machine - Prevent Time Machine from prompting to use new hard drives as backup volume"
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

echo "Time Machine - Disable local Time Machine backups"
hash tmutil &> /dev/null && sudo tmutil disablelocal
# }}}

# Activity Monitor {{{
echo "Activity Monitor - Show the main window when launching Activity Monitor"
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

echo "Activity Monitor - Visualize CPU usage in the Activity Monitor Dock icon"
defaults write com.apple.ActivityMonitor IconType -int 5

echo "Activity Monitor - Show all processes in Activity Monitor"
defaults write com.apple.ActivityMonitor ShowCategory -int 0

echo "Activity Monitor - Sort Activity Monitor results by CPU usage"
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0
# }}}

# App Store {{{
echo "App Store - Enable the WebKit Developer Tools"
defaults write com.apple.appstore WebKitDeveloperExtras -bool true

echo "App Store - Enable Debug Menu"
defaults write com.apple.appstore ShowDebugMenu -bool true

echo "App Store - Enable the automatic updates check"
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

echo "App Store - Turn on app auto-update"
defaults write com.apple.commerce AutoUpdate -bool true

echo "App Store - Check for updates daily, rather than weekly"
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

echo "App Store - Download newly available updates in the background"
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1

echo "App Store - Install system data files & security updates"
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1

echo "App Store - Automatically download apps purchased on other Macs"
defaults write com.apple.SoftwareUpdate ConfigDataInstall -int 1

echo "App Store - Allow the App Store to reboot machine on macOS updates"
defaults write com.apple.commerce AutoUpdateRestartRequired -bool true
# }}}

# Chrome {{{
echo "Chrome - disable backswipe on trackpads"
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false
defaults write com.google.Chrome.canary AppleEnableSwipeNavigateWithScrolls -bool false

echo "Chrome - disable backswipe on Magic Mouse"
defaults write com.google.Chrome AppleEnableMouseSwipeNavigateWithScrolls -bool false
defaults write com.google.Chrome.canary AppleEnableMouseSwipeNavigateWithScrolls -bool false

echo "Chrome - Use system-native print preview dialog"
defaults write com.google.Chrome DisablePrintPreview -bool true
defaults write com.google.Chrome.canary DisablePrintPreview -bool true

echo "Chrome - Expand the print dialog by default"
defaults write com.google.Chrome PMPrintingExpandedStateForPrint2 -bool true
defaults write com.google.Chrome.canary PMPrintingExpandedStateForPrint2 -bool true
# }}}

# Finder {{{{{{}}}
echo "Finder - Show hidden files"
defaults write com.apple.finder AppleShowAllFiles -bool true

echo "Finder - Show filename extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo "Finder - Disable the warning when changing a file extension"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

echo "Finder - Show path bar"
defaults write com.apple.finder ShowPathbar -bool true

echo "Finder - Show status bar"
defaults write com.apple.finder ShowStatusBar -bool true

echo "Finder - Display full POSIX path as window title"
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

echo "Finder -Always open everything in Finder's list view. This is important"
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

echo "Finder - Show the ~/Library folder"
chflags nohidden ~/Library

echo "Finder - Show the /Volumes folder"
sudo chflags nohidden /Volumes

echo "Finder - Set the prefs for showing a few different volumes on the Desktop."
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true

echo "Finder - Disable the warning before emptying the Trash"
defaults write com.apple.finder WarnOnEmptyTrash -bool false

echo "Finder - When searching and sorting by name, keep folders on top"
defaults write com.apple.finder _FXSortFoldersFirst -bool true

echo "Finder - When performing a search, search current folder by default"
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

echo "Finder - Avoid creating .DS_Store files on network or USB volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

echo "Finder - Disable disk image verification"
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

echo "Finder - Automatically open a new window when a volume is mounted"
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

echo "Finder - Show the ~/Library folder"
chflags nohidden ~/Library

echo "Finder - Show the /Volumes folder"
sudo chflags nohidden /Volumes

echo "Finder - Show path bar"
defaults write com.apple.finder ShowPathbar -bool true

# echo "Finder: allow quitting via ⌘ + Q; doing so will also hide desktop icons"
# defaults write com.apple.finder QuitMenuItem -bool true

echo "Finder - Set Desktop as the default location for new Finder windows"
# For other paths, use `PfLo` and `file:///full/path/here/`
defaults write com.apple.finder NewWindowTarget -string "PfDe"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Desktop/"

echo "Finder - Disable window animations and Get Info animations"
defaults write com.apple.finder DisableAllAnimations -bool true
# }}}

# Desktop {{{
# Show item info near icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo false" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:showItemInfo false" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:showItemInfo false" ~/Library/Preferences/com.apple.finder.plist

# Show item info belowthe icons on the desktop
/usr/libexec/PlistBuddy -c "Set DesktopViewSettings:IconViewSettings:labelOnBottom true" ~/Library/Preferences/com.apple.finder.plist

# Enable snap-to-grid for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# Increase grid spacing for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:gridSpacing 35" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:gridSpacing 35" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:gridSpacing 35" ~/Library/Preferences/com.apple.finder.plist

# Increase the size of icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 56" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:iconSize 56" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:iconSize 56" ~/Library/Preferences/com.apple.finder.plist
# }}}

# UX {{{
echo "UX - Disable Dashboard"
defaults write com.apple.dashboard mcx-disabled -bool true

echo "UX - Don't show Dashboard as a Space"
defaults write com.apple.dock dashboard-in-overlay -bool true

echo "UX - Disable mouse enlargement with jiggle"
defaults write ~/Library/Preferences/.GlobalPreferences CGDisableCursorLocationMagnification -bool true

echo "UX - Set the Reduce Motion UI option"
defaults write com.apple.universalaccess reduceMotion -bool true

echo "UX - Disable annoying UI error sounds."
defaults write com.apple.systemsound com.apple.sound.beep.volume -int 0
defaults write com.apple.sound.beep feedback -int 0
defaults write com.apple.systemsound com.apple.sound.uiaudio.enabled -int 0
osascript -e 'set volume alert volume 0'

echo "UX - Disable Notification Center and remove the menu bar icon"
launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist 2> /dev/null

echo "UX - Don't automatically rearrange Spaces based on most recent use"
defaults write com.apple.dock mru-spaces -bool false

echo "UX - Expand save panel by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

echo "UX - Expand print panel by default"
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

echo "UX - Save to disk (not to iCloud) by default"
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

echo "UX - Automatically quit printer app once the print jobs complete"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

echo "UX - Set sidebar icon size to medium"
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2

echo "UX - Always show scrollbars"
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
# Possible values: `WhenScrolling`, `Automatic` and `Always`

echo "UX - Disable the over-the-top focus ring animation"
defaults write NSGlobalDomain NSUseAnimatedFocusRing -bool false

echo "UX - Increase window resize speed for Cocoa applications"
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

# echo "UX - Run the screensaver if we're in the bottom-left hot corner"
# defaults write com.apple.dock wvous-bl-corner -int 5
# defaults write com.apple.dock wvous-bl-modifier -int 0

echo "UX - Change minimize/maximize window effect"
defaults write com.apple.dock mineffect -string "scale"

echo "UX - Minimize windows into their application’s icon"
defaults write com.apple.dock minimize-to-application -bool true
# }}}

# Safari {{{
echo "Safari - Hide the bookmark bar"
defaults write com.apple.Safari ShowFavoritesBar -bool false

echo "Safari - Set up for development"
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
# }}}

echo "Done. Note that some of these changes require a logout/restart to take effect."

# vim:foldmethod=marker:foldlevel=0
