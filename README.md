# Avahi in Docker container

This repository contains sources for [fat0troll/avahi](https://hub.docker.com/repository/docker/fat0troll/avahi) - Docker container.
  
**Note 1**: This container requires `host` or `macvlan` network type, and will **not** work in `bridge` (default mode) network. See `examples/docker-compose.yml` for details. If you can/want to make it work in `bridge` mode, PRs are welcome (see Note 3).

**Note 2**: This container tested under Linux and built for linux/amd64 only. That's because this is the only architecture used in my servers at the time. If you want to, you can send PR with changes for building image for other architectures.

## Preparations

Due to licensing issues Avahi example configuration files isn't included in this repository, so you need to grab it manually. You can do this by passing these commands:

```
$ docker create --name avahi-config fat0troll/avahi
$ docker cp avahi-config:/etc/avahi .
$ docker rm avahi-config
```

In the generated config files for Avahi you may add/remove your services (under `services` folder), and you **should** disable DBus otherwise it will not start at all. Add this to `avahi-daemon.conf` first section:

```
enable-dbus=no
```

## Starting from command-line example

```
$ docker run -it --name avahi --net=host \
	-v /path/to/avahi/configs:/etc/avahi \
	fat0troll:avahi
```

```