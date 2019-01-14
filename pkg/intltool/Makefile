# $FENRIR$
#
# Copyright © 2019, Colvin Wellborn All rights reserved.

PACKAGE		= intltool
ARCHIVE		= intltool-0.51.0.tar.gz
URL		= https://launchpad.net/intltool/trunk/0.51.0/+download
CHECKSUM	= 12e517cac2b57a0121cda351570f1e63
SOURCE_DIR	= intltool-0.51.0

default: build install clean

include $(CURDIR)/../../mk/pkg.mk

build: chroot-check fetch extract
	cd $(BUILD_DIR) \
	&& sed -i 's:\\\$${:\\\$$\\{:' intltool-update.in \
	&& ./configure \
		--prefix=/usr \
	&& make -j$(PKG_JOBS)

test:
	cd $(BUILD_DIR) && make check

install:
	cd $(BUILD_DIR) && make install

.PHONY: default build test install
