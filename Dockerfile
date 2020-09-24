FROM postgres:14

MAINTAINER Christoph Berg <christoph.berg@credativ.de>

RUN apt-get -q update && apt-get install -y build-essential postgresql-server-dev-14
