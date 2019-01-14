# $FENRIR$
#
# Copyright © 2019, Colvin Wellborn All rights reserved.

PACKAGE		= expat
ARCHIVE		= expat-2.2.6.tar.bz2
URL		= https://prdownloads.sourceforge.net/expat
CHECKSUM	= ca047ae951b40020ac831c28859161b2
SOURCE_DIR	= expat-2.2.6

default: build install clean

include $(CURDIR)/../../mk/pkg.mk

build: chroot-check fetch extract
	cd $(BUILD_DIR) \
	&& sed -i 's|usr/bin/env |bin/|' run.sh.in \
	&& ./configure \
		--prefix=/usr \
		--disable-static \
		--docdir=/usr/share/doc/expat-2.2.6 \
	&& make -j$(PKG_JOBS)

test:
	cd $(BUILD_DIR) && make check

install:
	cd $(BUILD_DIR) && make install

.PHONY: default build test install
