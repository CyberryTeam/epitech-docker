# epitech-docker
Docker image for continuous integration and deployment of Epitech projects

## Usage

### Current directory

```shell script
docker run --rm -v "$PWD:/tmp" cyberryteam/epitech-docker:ubuntu make
```

### Language specific

- C: `cyberryteam/epitech-docker:ubuntu-c`
- C++: `cyberryteam/epitech-docker:ubuntu-cpp`
- Python: `cyberryteam/epitech-docker:ubuntu-python`
