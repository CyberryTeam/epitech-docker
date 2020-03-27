FROM fedora:30

LABEL description="Epitech Docker based on Fedora 30 for continuous integration and continuous deployment."
LABEL maintener="Cyberry Team"

COPY /scripts /tmp/scripts

RUN ["bash", "/tmp/scripts/install.sh", "c", "cpp", "rm"]