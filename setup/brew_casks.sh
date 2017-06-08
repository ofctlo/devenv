#!/bin/bash

# TODO: This is brittle since this script is in a different location from where
# it presumes it is being called, this should be updated to work based on the
# relative positions of this script and the cask list.
cat ./brew_casks | xargs -o brew cask install
