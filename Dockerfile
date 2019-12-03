FROM postgres:9.6

MAINTAINER Christoph Berg <christoph.berg@credativ.de>

RUN apt-get -q update && apt-get install -y build-essential postgresql-server-dev-9.6
