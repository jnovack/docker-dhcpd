# DHCP
[![Docker Pulls](https://img.shields.io/docker/pulls/jnovack/dhcpd.svg)](https://hub.docker.com/r/jnovack/dhcpd/)

[ISC DHCP server](https://www.isc.org/software/dhcp/) server running on [Alpine Linux](https://hub.docker.com/_/alpine/).

## Configuration
See [example directory](https://github.com/jnovack/docker-dhcpd/tree/master/example.conf) for sample config file.

## `docker-compose.yml` Quickstart
```
dhcpd:
  image: jnovack/dhcpd

  net: host

  volumes:
    # Config pass through
    - ./dhcpd.conf:/etc/dhcp/dhcpd.conf
```
