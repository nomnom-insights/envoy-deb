FROM ubuntu:14.04
RUN apt-get update && apt-get install -y \
	build-essential ruby ruby-dev git-core \
	curl libmysqlclient-dev libpq-dev \
	libevent-dev libssl-dev libxml2-dev libxslt1-dev libreadline-dev
RUN gem install pkgr