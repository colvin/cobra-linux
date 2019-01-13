# $FENRIR$
#
# Copyright © 2019, Colvin Wellborn All rights reserved.

PACKAGE		= libtool
ARCHIVE		= libtool-2.4.6.tar.xz
URL		= http://ftp.gnu.org/gnu/libtool
CHECKSUM	= 1bfb9b923f2c1339b4d2ce1807064aa5
SOURCE_DIR	= libtool-2.4.6

default: build install clean

include $(CURDIR)/../../mk/pkg.mk

build: chroot-check fetch extract
	cd $(BUILD_DIR) \
	&& ./configure \
		--prefix=/usr \
	&& make -j$(PKG_JOBS)

test:
	cd $(BUILD_DIR) && make check

install:
	cd $(BUILD_DIR) && make install

.PHONY: default build test install
