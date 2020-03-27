#!/usr/bin/env bash

dnf update -y
dnf install -y SFML-devel
wget https://github.com/SFML/CSFML/archive/2.5.zip
unzip ./*.zip
mv CSFML-* CSFML
cd CSFML || exit 1
mkdir build
cd build || exit 1
cmake -DCMAKE_INSTALL_PREFIX=/usr ..
cmake --build .
make install
ldconfig