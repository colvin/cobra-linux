FROM debian:stretch

LABEL "org.label-schema.vendor"="cobra linux"
LABEL "org.label-schema.description"="cobra linux build container"
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

ADD cobra-src.tgz .

RUN bash setup/version-check.sh

ENV COBRA_CONTAINER 1
ENV PATH /tools/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN make setup

CMD [ "make", "COBRA_CONTAINER=1" ]
