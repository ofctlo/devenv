#!/bin/bash

grep -v '^$' ./brew_packages | while read package; do
  if [ -z "$package" ]; then
    continue
  fi

  if brew ls --versions $package > /dev/null; then
    echo "$package already installed, skipping." && continue
  fi

  brew install $package
done
