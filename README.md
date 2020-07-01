# epitech-docker

Docker images for continuous integration and deployment of Epitech projects

## Table of Contents

- [About](#about)
  - [Built with](#built-with)
- [Getting started](#getting-started)
  - [Prerequisites](#prerequisites)
- [Developing](#developing)
- [Using](#using)
  - [Current directory](#current-directory)
  - [Language specific](#language-specific)
- [Contributing](#contributing)
- [License](#license)

## About

Docker images with different environment (global and language specific) and different operating system (Ubuntu and Fedora) for continuous integration and deployment of Epitech projects.

### Built with

- [Docker](https://www.docker.com/)

## Getting started

### Prerequisites

1. [Install Docker](https://docs.docker.com/get-docker/)

## Developing

1. Clone the repository:

```shell script
git clone https://github.com/CyberryTeam/epitech-docker.git
cd epitech-docker
```

2. Build the image:

```shell script
docker build -t epitech-docker .
```

## Using

### Current directory

Fedora:

```shell script
docker run --rm -v "$PWD:/tmp" cyberryteam/epitech-docker:fedora make
```

Ubuntu:

```shell script
docker run --rm -v "$PWD:/tmp" cyberryteam/epitech-docker:ubuntu make
```

### Language specific

```shell script
docker run --rm -v "$PWD:/tmp" cyberryteam/epitech-docker:<tag> make
```

Replace `<tag>` by one of the following:

Fedora:

- C: `fedora-c`
- C++: `fedora-cpp`
- Python: `fedora-python`

Ubuntu:

- C: `ubuntu-c`
- C++: `ubuntu-cpp`
- Python: `ubuntu-python`

## Contributing

Bug reports, feature requests, other issues and pull requests are welcome.
See [`CONTRIBUTING.md`](CONTRIBUTING.md) for more information.

## License

Distributed under the [MIT](https://spdx.org/licenses/MIT.html) License.
See [`LICENSE`](LICENSE) for more information.
