#!/bin/sh

# Get script directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Setup homebrew if needed
if [[ ! -f /usr/local/bin/brew ]]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install everything from the Brewfile
brew bundle --file="$DIR/Brewfile"

# Setup preferences
if [[ ! -f ~/Library/Preferences/com.googlecode.iterm2.plist ]]; then
  cp $DIR/Preferences/com.googlecode.iterm2.plist ~/Library/Preferences/
fi

if [[ ! -f ~/Library/Preferences/com.generalarcade.flycut.plist ]]; then
  cp $DIR/Preferences/com.generalarcade.flycut.plist ~/Library/Preferences/
fi
