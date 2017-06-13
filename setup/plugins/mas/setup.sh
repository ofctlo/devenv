#!/bin/bash

mas_signin() {
  if ! reattach-to-user-namespace mas account; then
    reattach-to-user-namespace mas signin $1
  fi
}

mas_install_by_name() {
  mas_signin $2
  app_id=$(mas search $1 | grep -Ei "^\d+\s$1$" | grep -oE "\d+")
  reattach-to-user-namespace mas install $app_id
}

mas_install_by_name xcode brian.dale.mason@gmail.com
