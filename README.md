# 🎁

Make a Debian/ubuntu package for envoy, with upstart scripts and all that

# how to

1. build yourself some envoy

    `make bin`

2. make yourself a `.deb` package

    `make package`

3. verify it works

    `make test`


4. (optional) deploy to your private Bintray repo

    `make release`




# Using packaged envoy

- install the package (`dpkg -i`, add it to an apt repo etc)
- create configuration file in `/etc/default/envoy` && `/path/to/envoy.config.json` (see `./package-context/envoy.conf`)
- start it: `sudo service envoy start`

if you change configuration you can now do:

`service envoy restart` (or `stop` `start` etc)

## Requirements and assumptions

- you need Docker to build and package envoy, OSX and Linux are both supported as hosts
- you need Vagrant to verify if it works (upstart is broken in `ubuntu:14.04` image)
- envoy and package is built in and for Ubuntu 14.04
- upstart is the process manager


#### Releasing to [https://bintray.com](Bintray)

1. Create an apt repo in Bintray
2. Add envoy package (name must be envoy!)
3. Set following env vars:
   - `BINTRAY_USERNAME` - your Bintray username
   - `BINTRAY_API_KEY` - your Bintray api key
   - `BINTRAY_ORG` - your Bintray org name or username
   - `BINTRAY_APT_REPO` - your Bintray APT repo name


## TODO

- [x] make sure it works
- [x] add ulimit for upstart service definition
- [ ] make builds more customizable (Envoy sha/version)
- [ ] handle different distribution, different process manager etc


## License

GPL
