#!/usr/bin/env bash

ALL="all"
ALL_TARGET="core c cpp python"

function test() {
  (
    cd "$1" || exit 1
    make
    ./a.out
  )
}

if [[ "$*" =~ $ALL ]]; then
  for target in $ALL_TARGET; do
    test "$target"
  done
else
  for target in "$@"; do
    test "$target"
  done
fi
