#!/bin/bash

# Menubar clock
defaults write com.apple.menuextra.clock DateFormat "EEE MMM d  H:mm:ss"
defaults write com.apple.menuextra.clock FlashDateSeparators NO
defaults write com.apple.menuextra.clock IsAnalog NO

killall -KILL SystemUIServer

# Safari tab navigation
defaults write com.apple.Safari NSUserKeyEquivalents \
  -dict-add 'Show Previous Tab' -string '@$['
defaults write com.apple.Safari NSUserKeyEquivalents \
  -dict-add 'Show Next Tab' -string '@$]'

if ( ! defaults read com.apple.universalaccess 'com.apple.custommenu.apps' | grep 'Safari' ); then
  defaults write com.apple.universalaccess 'com.apple.custommenu.apps' \
    -array-add 'com.apple.Safari'
fi

defaults write com.apple.TextEdit RichText -int 0
