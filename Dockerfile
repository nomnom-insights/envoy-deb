FROM ruby:2.3.3-slim

RUN mkdir /build
WORKDIR /build

RUN gem install pkgr

COPY ./bin/* /build/

COPY ./package.sh /build/package.sh
