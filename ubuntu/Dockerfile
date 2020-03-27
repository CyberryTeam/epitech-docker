FROM ubuntu:19.10

LABEL description="Epitech Docker based on Ubuntu 18.04 for continuous integration and continuous deployment."
LABEL maintener="Cyberry Team"

COPY /scripts /tmp/scripts

RUN ["bash", "/tmp/scripts/install.sh", "c", "cpp", "rm"]