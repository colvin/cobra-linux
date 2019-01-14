# $FENRIR$
#
# Copyright © 2019, Colvin Wellborn All rights reserved.

PACKAGE		= elfutils
ARCHIVE		= elfutils-0.173.tar.bz2
URL		= https://sourceware.org/ftp/elfutils/0.173
CHECKSUM	= 35decb1ebfb90d565e4c411bee4185cc
SOURCE_DIR	= elfutils-0.173

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
	cd $(BUILD_DIR) \
	&& make -C libelf install \
	&& install -m 644 config/libelf.pc /usr/lib/pkgconfig

.PHONY: default build test install
