FROM ubuntu:20.04

ARG IMAGE_CREATION
ARG IMAGE_VERSION

LABEL fr.cyberry.image.created=${IMAGE_CREATION}
LABEL fr.cyberry.image.authors="Cyberry Team <team@cyberry.fr> (@CyberryTeam)"
LABEL fr.cyberry.image.url="https://hub.docker.com/r/cyberryteam/epitech-docker"
LABEL fr.cyberry.image.source="https://github.com/CyberryTeam/epitech-docker"
LABEL fr.cyberry.image.version=${IMAGE_VERSION}
LABEL fr.cyberry.image.vendor="Cyberry"
LABEL fr.cyberry.image.licenses="MIT"
LABEL fr.cyberry.image.title="Epitech Docker"
LABEL fr.cyberry.image.description="Docker image for continuous integration and deployment of Epitech projects"

SHELL ["/bin/bash", "-c"]

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y software-properties-common

ARG IMAGE_PACKAGES

RUN apt-get install -y \
    build-essential \
    cmake \
    doxygen \
    gcovr \
    git \
    valgrind \
    wget \
    zip

RUN if [[ "$IMAGE_PACKAGES" =~ "all" || "$IMAGE_PACKAGES" =~ "c" ]] ; \
    then apt-get install -y \
        libcsfml-dev \
        libncurses-dev \
        libsdl2-dev \
        libsdl2-image-dev \
        libsdl2-ttf-dev \
        libxml2-dev \
        uuid-dev \
    ; fi

RUN if [[ "$IMAGE_PACKAGES" =~ "all" || "$IMAGE_PACKAGES" =~ "cpp" ]] ; \
    then apt-get install -y \
        libsfml-dev \
    ; fi

RUN if [[ "$IMAGE_PACKAGES" =~ "all" || "$IMAGE_PACKAGES" =~ "python" ]] ; \
    then apt-get install -y \
        python3 \
        python3-numpy \
        python3-pip \
        python3-venv \
        python3-virtualenv \
    ; fi

WORKDIR tmp/
COPY build/ build/

RUN bash build/core/criterion.sh

RUN if [[ "$IMAGE_PACKAGES" =~ "all" || "$IMAGE_PACKAGES" =~ "cpp" ]] ; \
    then \
        bash build/cpp/irrlicht.sh \
    ; fi

RUN rm -rf *

RUN apt-get autoremove -y && \
    apt-get clean
