# $FENRIR$
#
# Copyright © 2019, Colvin Wellborn All rights reserved.

FROM debian:stretch

LABEL "org.label-schema.vendor"="fenrir linux"
LABEL "org.label-schema.description"="fenrir linux build container"
LABEL "org.label-schema.maintainer"="colvin"

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		build-essential \
		autoconf \
		automake \
		bison \
		ca-certificates \
		curl \
		gawk \
		libtool \
		flex \
		texinfo \
		vim \
	&& rm -rf /var/lib/apt/lists/* \
	&& ln -sf /bin/bash /bin/sh

WORKDIR /src

ADD fenrir-src.tgz .

RUN bash setup/version-check.sh

ENV FENRIR_CONTAINER 1
ENV PATH /tools/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN make setup

CMD [ "make", "FENRIR_CONTAINER=1" ]
