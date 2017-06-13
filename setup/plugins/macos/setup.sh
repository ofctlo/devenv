#!/bin/bash

defaults write com.apple.menuextra.clock DateFormat "EEE MMM d  H:mm:ss"
defaults write com.apple.menuextra.clock FlashDateSeparators NO
defaults write com.apple.menuextra.clock IsAnalog NO

killall -KILL SystemUIServer
