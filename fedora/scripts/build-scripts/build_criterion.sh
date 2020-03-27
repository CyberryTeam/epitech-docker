#!/usr/bin/env bash

git clone --branch v2.3.3 --recursive https://github.com/Snaipe/Criterion
cd Criterion || exit 1
mkdir build
cd build || exit 1
cmake -DCMAKE_INSTALL_PREFIX=/usr ..
cmake --build .
make install
ldconfig