#!/usr/bin/env bash

SCRIPTS_PATH="/tmp/scripts"
BUILD_SCRIPTS_FOLDER="build-scripts"

PPAS_ALL="
"

PPAS_C="
"

PPAS_CPP="
"

PACKAGES_ALL="
build-essential
cmake
doxygen
gcovr
git
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
libsdl2-dev
libsdl2-image-dev
libsdl2-ttf-dev
"

PACKAGES_CPP="
libsfml-dev
"

BUILD_SCRIPTS_ALL="
build_criterion.sh
"

BUILD_SCRIPTS_C="
"

BUILD_SCRIPTS_CPP="
"

cd ${SCRIPTS_PATH} || exit 1

apt-get update
apt-get upgrade -y
apt-get install -y software-properties-common

for PPA in ${PPAS_ALL} ; do
    add-apt-repository -y "ppa:${PPA}"
done
for PARAM in "$@" ; do
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
apt-get update

apt-get install -y ${PACKAGES_ALL}
apt-get install -y ${PACKAGES_LANG}
for PARAM in "$@" ; do
    if [[ "$PARAM" = "c" ]]; then
        apt-get install -y ${PACKAGES_C}
    fi
    if [[ "$PARAM" = "cpp" ]]; then
        apt-get install -y ${PACKAGES_CPP}
    fi
done

for SCRIPT in ${BUILD_SCRIPTS_ALL} ; do
    bash "${BUILD_SCRIPTS_FOLDER}/${SCRIPT}"
done
for PARAM in "$@" ; do
    if [[ "$PARAM" = "c" ]]; then
        for SCRIPT in ${BUILD_SCRIPTS_C} ; do
            bash "${BUILD_SCRIPTS_FOLDER}/${SCRIPT}"
        done
    fi
    if [[ "$PARAM" = "cpp" ]]; then
        for SCRIPT in ${BUILD_SCRIPTS_CPP} ; do
            bash "${BUILD_SCRIPTS_FOLDER}/${SCRIPT}"
        done
    fi
done

apt-get autoremove -y
apt-get clean

for PARAM in "$@" ; do
    if [[ "$PARAM" = "rm" ]]; then
        rm -rf ${SCRIPTS_PATH}
    fi
done