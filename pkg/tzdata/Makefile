# $FENRIR$
#
# Copyright © 2019, Colvin Wellborn All rights reserved.

PACKAGE		= tzdata
ARCHIVE		= tzdata2018e.tar.gz
URL		= https://www.iana.org/time-zones/repository/releases
CHECKSUM	= 97d654f4d7253173b3eeb76a836dd65e
SOURCE_DIR	=

default: build install clean

include $(CURDIR)/../../mk/pkg.mk

build: chroot-check fetch extract

test:

TZ = \
	etcetera \
	southamerica \
	northamerica \
	europe \
	africa \
	antarctica \
	asia \
	australasia \
	backward \
	pacificnew \
	systemv

install:
	cd $(BUILD_DIR) \
	&& ZONEINFO=/usr/share/zoneinfo \
	&& mkdir -pv $$ZONEINFO/{posix,right} \
	&& for tz in $(TZ); do \
	    zic -L /dev/null   -d $$ZONEINFO       -y "sh yearistype.sh" $${tz}; \
	    zic -L /dev/null   -d $$ZONEINFO/posix -y "sh yearistype.sh" $${tz}; \
	    zic -L leapseconds -d $$ZONEINFO/right -y "sh yearistype.sh" $${tz}; \
	done \
	&& cp -v zone.tab zone1970.tab iso3166.tab $$ZONEINFO \
	&& zic -d $$ZONEINFO -p America/New_York \
	&& ln -sf /usr/share/zoneinfo/UTC /etc/localtime

.PHONY: default build test install
