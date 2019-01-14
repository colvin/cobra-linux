# $FENRIR$
#
# Copyright © 2019, Colvin Wellborn All rights reserved.

PACKAGE		= automake
ARCHIVE		= automake-1.16.1.tar.xz
URL		= http://ftp.gnu.org/gnu/automake
CHECKSUM	= 53f38e7591fa57c3d2cee682be668e5b
SOURCE_DIR	= automake-1.16.1

default: build install clean

include $(CURDIR)/../../mk/pkg.mk

build: chroot-check fetch extract
	cd $(BUILD_DIR) \
	&& ./configure \
		--prefix=/usr \
		--docdir=/usr/share/doc/automake-1.16.1 \
	&& make -j$(PKG_JOBS)

test:
	cd $(BUILD_DIR) && make -j$(PKG_JOBS) check

install:
	cd $(BUILD_DIR) && make install

.PHONY: default build test install
