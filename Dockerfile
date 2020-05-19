FROM fedora:30

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

RUN dnf update -y

ARG IMAGE_PACKAGES

RUN dnf install -y \
    automake \
    cmake \
    doxygen \
    gcc \
    gcc-c++ \
    gcovr \
    git \
    kernel-devel \
    make \
    valgrind \
    wget \
    zip

RUN if [[ "$IMAGE_PACKAGES" =~ "all" || "$IMAGE_PACKAGES" =~ "c" ]] ; \
    then dnf install -y \
        ncurses-devel \
        SDL2-devel \
        SDL2_image-devel \
        SDL2_ttf-devel \
        libxml2-devel \
    ; fi

RUN if [[ "$IMAGE_PACKAGES" =~ "all" || "$IMAGE_PACKAGES" =~ "cpp" ]] ; \
    then dnf install -y \
        SFML-devel \
    ; fi

RUN if [[ "$IMAGE_PACKAGES" =~ "all" || "$IMAGE_PACKAGES" =~ "python" ]] ; \
    then dnf install -y \
        python3 \
        python3-numpy \
        python3-virtualenv \
    ; fi

WORKDIR tmp/
COPY build/ build/

RUN bash build/core/criterion.sh

RUN if [[ "$IMAGE_PACKAGES" =~ "all" || "$IMAGE_PACKAGES" =~ "c" ]] ; \
    then \
        bash build/c/csfml.sh \
    ; fi

RUN rm -rf *

RUN dnf autoremove -y && \
    dnf clean all
