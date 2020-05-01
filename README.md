# epitech-docker
Docker image for continuous integration and deployment of Epitech projects

## Usage

### Current directory

```shell script
docker run --rm -v "$PWD:/tmp" cyberryteam/epitech-docker:fedora make
```

### Language specific

- C: `cyberryteam/epitech-docker:fedora-c`
- C++: `cyberryteam/epitech-docker:fedora-cpp`
- Python: `cyberryteam/epitech-docker:fedora-python`
