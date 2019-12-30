#!/usr/bin/env bash
echo Installing desktop apps

brew cask install \
    1password \
    slack \
    spectacle \
    karabiner-elements \

# per Karabiner docs, need parent dir sym link, not json config sym link
ln -sf $(pwd)/karabiner $HOME/.config

# force reload after symlink creation
is_ci || launchctl kickstart -k gui/`id -u`/org.pqrs.karabiner.karabiner_console_user_server

is_ci || osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Karabiner-Elements.app", hidden:true}' > /dev/null


###############################################################################
# Config OSX                                                                  # 
###############################################################################

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# General                                                                     #
###############################################################################
# Reveal IP address, hostname, OS version, etc. when clicking the clock in the login window
sudo defaults delete /Library/Preferences/com.apple.loginwindow AdminHostInfo

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Minimize windows into their application’s icon
defaults write com.apple.dock minimize-to-application -bool false

###############################################################################
# Finder                                                                      #
###############################################################################

# Finder: show hidden files by default
defaults write com.apple.Finder AppleShowAllFiles -bool true
