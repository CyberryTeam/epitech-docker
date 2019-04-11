#!/usr/bin/env bash

git clone --recursive https://github.com/Snaipe/Criterion
cd Criterion
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=/usr ..
cmake --build .
make install
ldconfig