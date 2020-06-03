#!/usr/bin/env bash

IRRLICHT_DIRECTORY="irrlicht-1.8.4"
IRRLICHT_ARCHIVE="http://downloads.sourceforge.net/irrlicht/irrlicht-1.8.4.zip"

wget -nc $IRRLICHT_ARCHIVE
unzip ./*.zip
cd $IRRLICHT_DIRECTORY/source/Irrlicht || exit 1
make sharedlib
make install
ldconfig
cd ..
