#!/bin/bash

(
  previous_dir=$PWD
  dir="$( dirname ${BASH_SOURCE[0]} )"

  cd "$dir"

  grep -v '^$' ./packages.list | while read package; do
    if [ -z "$package" ]; then
      continue
    fi

    npm install -g $package
  done

  cd "$previous_dir"
)
