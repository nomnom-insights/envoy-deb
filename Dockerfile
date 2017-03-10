FROM ubuntu:14.04
RUN apt-get update && apt-get install -y build-essential ruby ruby-dev git-core
RUN gem install pkgr