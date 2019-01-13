# $FENRIR$
#
# Copyright © 2019, Colvin Wellborn All rights reserved.

PACKAGE		= pkg-config
ARCHIVE		= pkg-config-0.29.2.tar.gz
URL		= https://pkg-config.freedesktop.org/releases
CHECKSUM	= f6e931e319531b736fadc017f470e68a
SOURCE_DIR	= pkg-config-0.29.2

default: build install clean

include $(CURDIR)/../../mk/pkg.mk

build: chroot-check fetch extract
	cd $(BUILD_DIR) \
	&& ./configure \
		--prefix=/usr \
		--with-internal-glib \
		--disable-host-tool \
		--docdir=/usr/share/doc/pkg-config-0.29.2 \
	&& make -j$(PKG_JOBS)

test:
	cd $(BUILD_DIR) && make check

install:
	cd $(BUILD_DIR) && make install

.PHONY: default build test install
