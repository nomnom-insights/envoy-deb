FROM ubuntu:14.04
RUN apt-get update && apt-get install -y \
	build-essential ruby ruby-dev git-core \
	curl libmysqlclient-dev libpq-dev \
	libevent-dev libssl-dev libxml2-dev libxslt1-dev libreadline-dev

RUN mkdir /tmp/pkgr && cd /tmp/pkgr && \
    git clone https://github.com/crohr/pkgr.git || true && \
    cd pkgr && \
    git checkout 021aec97050bbbd90c744ea60aea8afc73599cbc && \
    gem install bundler --no-ri --no-rdoc && \
    bundle

RUN cd /tmp/pkgr/pkgr && \
    gem build pkgr.gemspec  && gem install pkgr-1.5.1.gem && \
    pkgr help package
