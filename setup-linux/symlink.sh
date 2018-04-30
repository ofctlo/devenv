#!/bin/bash

# There must be a way to do this without cd
cd ./config
for f in `ls`; do
  ln -fs $PWD/$f ~/.$f;
done
cd -
