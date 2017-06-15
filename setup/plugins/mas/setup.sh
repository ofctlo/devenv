#!/bin/bash

mas_signin() {
  if ! reattach-to-user-namespace mas account; then
    reattach-to-user-namespace mas signin $1
  fi
}

mas_install_by_name() {
  mas_signin $2
  app_pattern="${1// /\s}"
  app_id=$(mas search "$1" | grep -Ei "^\d+\s$app_pattern$" | grep -oE "\d+")
  reattach-to-user-namespace mas install $app_id
}

mas_install_by_name xcode brian.dale.mason@gmail.com
mas_install_by_name 'Tweetbot for Twitter' brian.dale.mason@gmail.com
