#!/usr/bin/env bash

CSFML_DIRECTORY="CSFML"
CSFML_REPOSITORY="https://github.com/SFML/CSFML"
CSFML_VERSION="2.5"

dnf update -y
dnf install -y SFML-devel

git clone --branch "$CSFML_VERSION" --recursive "$CSFML_REPOSITORY" "$CSFML_DIRECTORY"
cd "$CSFML_DIRECTORY" || exit 1
mkdir build
cd build || exit 1
cmake -DCMAKE_INSTALL_PREFIX=/usr ..
cmake --build .
make install
ldconfig
cd ..
