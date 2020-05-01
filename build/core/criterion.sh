#!/usr/bin/env bash

CRITERION_DIRECTORY="Criterion"
CRITERION_REPOSITORY="https://github.com/Snaipe/Criterion"
CRITERION_VERSION="v2.3.3"

git clone --branch "$CRITERION_VERSION" --recursive "$CRITERION_REPOSITORY" "$CRITERION_DIRECTORY"
cd "$CRITERION_DIRECTORY" || exit 1
mkdir build
cd build || exit 1
cmake -DCMAKE_INSTALL_PREFIX=/usr ..
cmake --build .
make install
ldconfig
cd ..
