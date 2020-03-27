#!/usr/bin/env bash

SCRIPTS_PATH="/tmp/scripts"
BUILD_SCRIPTS_FOLDER="build-scripts"

PACKAGES_ALL="
automake
cmake
doxygen
gcc
gcc-c++
gcovr
git
kernel-devel
make
valgrind
wget
zip
"

PACKAGES_LANG="
python
python3
"

PACKAGES_C="
ncurses-devel
SDL2-devel
SDL2_image-devel
SDL2_ttf-devel
"

PACKAGES_CPP="
SFML-devel
"

BUILD_SCRIPTS_ALL="
build_criterion.sh
"

BUILD_SCRIPTS_C="
build_csfml.sh
"

BUILD_SCRIPTS_CPP="
"

cd ${SCRIPTS_PATH} || exit 1

dnf update -y

dnf install -y ${PACKAGES_ALL}
dnf install -y ${PACKAGES_LANG}
for PARAM in "$@" ; do
    if [[ "$PARAM" = "c" ]]; then
        dnf install -y ${PACKAGES_C}
    fi
    if [[ "$PARAM" = "cpp" ]]; then
        dnf install -y ${PACKAGES_CPP}
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

dnf autoremove -y
dnf clean all

for PARAM in "$@" ; do
    if [[ "$PARAM" = "rm" ]]; then
        rm -rf ${SCRIPTS_PATH}
    fi
done