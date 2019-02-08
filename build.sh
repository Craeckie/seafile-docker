#!/bin/bash
git pull --rebase upstream master
git push
pushd image/
  pushd base/
  docker build -t 'seafileltd/base:18.04' .
  popd

  pushd seafile/
  cp -rf ../../scripts ./
  docker build -t 'seafileltd/seafile:18.04' .
  popd
popd
