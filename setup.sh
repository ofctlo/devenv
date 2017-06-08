#!/bin/bash
# Step 0: Update Some Global Config

# Set fastest key repeat
defaults write -g InitialKeyRepeat -int 15 
defaults write -g KeyRepeat -int 2 

# Step 1: Install Homebrew
if hash brew 2>/dev/null; then
  echo "brew already installed, proceeding with setup."
else
  /usr/bin/ruby -e \
  "$(curl -fsSL \
  https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Step 2: Install Homebrew Packages
./setup/brew_packages.sh

# Step 3: Install Homebrew Casks
./setup/brew_casks.sh

# Step 4: Symlink config files
./setup/symlink.sh
