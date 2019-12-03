#!/bin/sh

set -eux
PGVERSIONS="
  12
  11
  10
  9.6
  9.5
  9.4
"

for PGVERSION in $PGVERSIONS; do
	git checkout $PGVERSION || git checkout -b $PGVERSION

	cat > Dockerfile <<-EOF
	FROM postgres:$PGVERSION
	
	MAINTAINER Christoph Berg <christoph.berg@credativ.de>
	
	RUN apt-get -q update && apt-get install -y build-essential postgresql-server-dev-$PGVERSION
	EOF

	git add Dockerfile
	git commit -m "Update Dockerfile for $PGVERSION" Dockerfile
	git checkout -
done
