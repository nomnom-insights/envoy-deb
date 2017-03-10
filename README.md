# :nope: this is still WIP

make a Debian/ubuntu package for envoy, with upstart scripts and all that

# how to

1. build yourself some envoy

    `./build-bin.sh`

2. make yourself a `.deb` package

    `./make-deb.sh`

# Using packaged envoy

- install the package (`dpkg -i`, add it to an apt repo etc)
- create configuration file
- set config with: `sudo envoy config CONFIG_PATH=/path/to/json.conf.json`
- start it: `sudo envoy scale envoy=1`

if you change configuration you can now do:

`service envoy restart` (or `stop` `start` etc)

## Requirements and info

- you need Docker to build and package envoy, OSX and Linux are both supported as hosts
- envoy and package is built for Ubuntu 14.04
- upstart is the process manager



## TODO

- [ ] add all envoy flags to `Procfile` and expose them via ENV vars
- [ ] make sure it works
- [ ] add ulimit for upstart service definition


## License

GPL
