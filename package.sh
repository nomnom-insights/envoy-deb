cd ./envoy
versionStr="1.1.-$(git rev-parse --abbrev-ref HEAD)"
cd ../bin

bundle exec  pkgr package . \
       --env ENVOY \
       --user=envoy \
       --group=envoy \
       --runner=upstart-1.5 \
       --version="$versionStr" \
       --buildpack=git@github.com:ph3nx/heroku-binary-buildpack.git \
       --compile-cache-dir=/tmp/compile \
       --buildpacks-cache-dir=/tmp/build
