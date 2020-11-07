
# darknetsvc/bind:0.2

- [Introduction](#introduction)
  - [Howto use it](#how-to-use-it)
  - [Contributing](#how-to-use-it)
  - [Issues](#issues)
  - [Quickstart](#quickstart)
 

# Introduction

Debian based docker image for a local / private DNS resolver, capable of resolving both IANA and OpenNIC domains.


`Dockerfile` to create a [Docker](https://www.docker.com/) container image for [BIND](https://www.isc.org/downloads/bind/) DNS server.
`docker-compose.yml` to create a [Docker Compose](https://www.docker.com/) stack [BIND](https://www.isc.org/downloads/bind/) DNS server.


BIND is open source software that implements the Domain Name System (DNS) protocols for the Internet. It is a reference implementation of those protocols, but it is also production-grade software, suitable for use in high-volume and high-reliability applications.


There are currently two flavours of DNS server configurations ready to be pulled and used:

    Bind9 | docker pull darknetsvc/bind:bind
    UNBOUND | docker pull darknetsvc/bind:wip


## How to use it |

Pull the docker image according to the desired DNS server flavour.

Run the container (requires root privileges in order to use ports < 1024):

```
$ docker-compose build
```

It's probably a good idea to access the terminal and update system packages before starting to use the service:

```
$ docker exec -it resolver bash
$ apt update && apt upgrade -y
```

Test the resolver (assuming that you have dnsutils / digg installed on linux or mac):

dig @127.0.0.1 docker.com


## Contributing

If you find this image useful here's how you can help:

- Send a pull request with your awesome features and bug fixes
- Help users resolve their [issues](../../issues?q=is%3Aopen+is%3Aissue).
- Support the development of this image with a [donation](BTC: )

## Issues

- Scaleway (Online.net) is known to drop SOA requests randomly.

## Quickstart

Start BIND using:

```bash
$ docker-compose up
```
