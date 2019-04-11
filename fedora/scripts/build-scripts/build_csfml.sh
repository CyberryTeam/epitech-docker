#!/usr/bin/env bash

wget https://github.com/SFML/CSFML/archive/2.4.zip
unzip *.zip
mv CSFML-* CSFML
cd CSFML
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=/usr ..
cmake --build .
make install
ldconfig