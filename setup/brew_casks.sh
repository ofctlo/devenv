#!/bin/bash

# TODO: This is brittle since this script is in a different location from where
# it presumes it is being called, this should be updated to work based on the
# relative positions of this script and the cask list.
grep -v '^$' ./brew_casks | while read cask; do
  if [ -z "$cask" ]; then
    continue
  fi

  if brew cask ls --versions $cask > /dev/null; then
    echo "$cask already isntalled, skipping." && continue
  fi

  brew cask install $cask
done
