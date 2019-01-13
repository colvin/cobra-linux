# $FENRIR$
#
# Copyright © 2019, Colvin Wellborn All rights reserved.

PACKAGE		= mpc
ARCHIVE		= mpc-1.1.0.tar.gz
URL		= https://ftp.gnu.org/gnu/mpc
CHECKSUM	= 4125404e41e482ec68282a2e687f6c73
SOURCE_DIR	= mpc-1.1.0

default: build test install clean

include $(CURDIR)/../../mk/pkg.mk

build: chroot-check fetch extract
	cd $(BUILD_DIR) \
	&& ./configure \
		--prefix=/usr \
		--disable-static \
		--docdir=/usr/share/doc/mpc-1.1.0 \
	&& make -j$(PKG_JOBS)

test:
	cd $(BUILD_DIR) && make check

install:
	cd $(BUILD_DIR) && make install

.PHONY: default build test install
