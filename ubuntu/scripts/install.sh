#!/usr/bin/env bash

SCRIPTS_PATH="/tmp/scripts"

PPAS_ALL="
snaipewastaken/ppa
"

PPAS_C="
"

PPAS_CPP="
"

PACKAGES_ALL="
build-essential
cmake
criterion-dev
doxygen
gcovr
valgrind
wget
zip
"

PACKAGES_LANG="
python
python3
"

PACKAGES_C="
libcsfml-dev
libncurses-dev
"

PACKAGES_CPP="
"

cd ${SCRIPTS_PATH}

apt update
apt upgrade -y
apt install -y software-properties-common

for PPA in ${PPAS_ALL} ; do
    add-apt-repository -y "ppa:${PPA}"
done
for PARAM in $@ ; do
    if [[ "$PARAM" = "c" ]]; then
        for PPA in ${PPAS_C} ; do
            add-apt-repository -y "ppa:${PPA}"
        done
    fi
    if [[ "$PARAM" = "cpp" ]]; then
        for PPA in ${PPAS_CPP} ; do
            add-apt-repository -y "ppa:${PPA}"
        done
    fi
done
apt update

apt install -y ${PACKAGES_ALL}
apt install -y ${PACKAGES_LANG}
for PARAM in $@ ; do
    if [[ "$PARAM" = "c" ]]; then
        apt install -y ${PACKAGES_C}
    fi
    if [[ "$PARAM" = "cpp" ]]; then
        apt install -y ${PACKAGES_CPP}
    fi
done

apt autoremove -y
apt clean

for PARAM in $@ ; do
    if [[ "$PARAM" = "rm" ]]; then
        rm -rf ${SCRIPTS_PATH}
    fi
done