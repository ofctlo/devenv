#!/bin/bash

(
  previous_dir=$PWD
  dir="$( dirname ${BASH_SOURCE[0]} )"

  cd "$dir"

  # Install pathogen if necessary
  if [ ! -f ./.vim/autoload/pathogen.vim ]; then
    curl -LSso ./.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
  fi

  # Install packages into .vim/bundle
  bundle_dir="./.vim/bundle"
  mkdir -p "$bundle_dir"

  grep -v '^$' ./bundles.list | while read url; do
    if [ -z "$url" ]; then
      continue
    fi
    
    plugin=`basename $url` # Get plugin name from url
    plugin=${plugin%.git} # Remove .git
    plugin_dir="$bundle_dir/$plugin"

    if [ ! -d "$plugin_dir" ]; then
      git clone $url "$plugin_dir"
    fi
  done
  ln -s $PWD/.vim/ ~
  cd "$previous_dir"
)
