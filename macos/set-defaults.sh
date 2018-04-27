#!/bin/sh
source /Users/jared/dotfiles/functions/fancy_echo

# Sets reasonable macOS defaults.
#
# Or, in other words, set shit how I like in macOS.
#
# The original idea (and a couple settings) were grabbed from:
#   https://github.com/mathiasbynens/dotfiles/blob/master/.macos
#
# Run ./set-defaults.sh and you'll be good to go.

fancy_echo "--> Apply system and application defaults..."


fancy_echo_line "System - Disable the 'Are you sure you want to open this application?' dialog"
defaults write com.apple.LaunchServices LSQuarantine -bool false

fancy_echo_line "System - Disable auto-correct"
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

fancy_echo_line "System - Avoid creating .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

fancy_echo_line "System - Don't try to Time Machine all my external drives."
defaults write DoNotOfferNewDisksForBackup com.apple.TimeMachine -int 1

fancy_echo_line "System - Disable sudden motion sensor. (Not useful for SSDs)."
sudo pmset -a sms 0

fancy_echo_line "System - Use Cloudflare DNS globally"
bash ./use_cloudflare_dns.sh


fancy_echo_line "Security - Disable captive portal hijacking attack"
defaults write /Library/Preferences/SystemConfiguration/com.apple.captive.control Active -bool false

fancy_echo_line "Security - Don't respond to ICMP pings and TCP/UDP requests on clsoed ports"
defaults write /Library/Preferences/com.apple.alf stealthenabled -bool true

# fancy_echo_line "System - Disable smart quotes (not useful when writing code)"
# defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# fancy_echo_line "System - Disable smart dashes (not useful when writing code)"
# defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false


fancy_echo_line "Keyboard - Enable keyboard access for all controls"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

fancy_echo_line "Keyboard - Disable press-and-hold for keys in favor of key repeat."
defaults write -g ApplePressAndHoldEnabled -bool false

fancy_echo_line "Keyboard - Set a really fast key repeat"
defaults write NSGlobalDomain KeyRepeat -int 1


fancy_echo_line "Trackpad - Enable tap to click for current user and the login screen"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

fancy_echo_line "Trackpad - Reverse scroll direction"
defaults write -g com.apple.swipescrolldirection -bool YES

fancy_echo_line "Bluetooth - Increase sound quality for headphones/headsets"
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

fancy_echo_line "Filesharing - Use AirDrop over every interface. srsly this should be a default."
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1


fancy_echo_line "Dock - Automatically hide and show"
defaults write com.apple.dock autohide -bool true

fancy_echo_line "Dock - Remove the auto-hiding delay"
defaults write com.apple.Dock autohide-delay -float 0

fancy_echo_line "Dock - Don’t show Dashboard as a Space"
defaults write com.apple.dock "dashboard-in-overlay" -bool true

fancy_echo_line "Dock - Use the dark theme"
defaults write ~/Library/Preferences/.GlobalPreferences AppleInterfaceStyle -string "Dark"

fancy_echo_line "Finder - Show hidden files"
defaults write com.apple.finder AppleShowAllFiles -bool true

fancy_echo_line "Finder - Show filename extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

fancy_echo_line "Finder - Disable the warning when changing a file extension"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

fancy_echo_line "Finder - Show path bar"
defaults write com.apple.finder ShowPathbar -bool true

fancy_echo_line "Finder - Show status bar"
defaults write com.apple.finder ShowStatusBar -bool true

fancy_echo_line "Finder - Display full POSIX path as window title"
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

fancy_echo_line "Finder -Always open everything in Finder's list view. This is important"
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

fancy_echo_line "Finder - Show the ~/Library folder"
chflags nohidden ~/Library

fancy_echo_line "Finder - Show the /Volumes folder"
sudo chflags nohidden /Volumes

fancy_echo_line "Finder - Set the prefs for showing a few different volumes on the Desktop."
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

fancy_echo_line "Finder - Disable the warning before emptying the Trash"
defaults write com.apple.finder WarnOnEmptyTrash -bool false


fancy_echo_line "UX - Disable mouse enlargement with jiggle"
defaults write ~/Library/Preferences/.GlobalPreferences CGDisableCursorLocationMagnification -bool true

fancy_echo_line "UX - Disable annoying UI error sounds."
defaults write com.apple.systemsound com.apple.sound.beep.volume -int 0
defaults write com.apple.sound.beep feedback -int 0
defaults write com.apple.systemsound com.apple.sound.uiaudio.enabled -int 0
osascript -e 'set volume alert volume 0'


# Run the screensaver if we're in the bottom-left hot corner.
# defaults write com.apple.dock wvous-bl-corner -int 5
# defaults write com.apple.dock wvous-bl-modifier -int 0

fancy_echo_line "Safari - Hide the bookmark bar"
defaults write com.apple.Safari ShowFavoritesBar -bool false

fancy_echo_line "Safari - Set up for development"
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true


fancy_echo_line "VSCode - Allow key repeat with Vim Mode"
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false
