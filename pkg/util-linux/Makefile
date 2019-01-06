# $FENRIR: pkg/util-linux/Makefile 8b800ad0c3c6da18caa0053206ed595631f65d1d 2019-01-05T19:35:21-05:00 colvin $
#
# Copyright (c) 2019, Colvin Wellborn All rights reserved.

PACKAGE		= util-linux
ARCHIVE		= util-linux-2.32.1.tar.xz
URL		= https://www.kernel.org/pub/linux/utils/util-linux/v2.32
CHECKSUM	= 9e5b1b8c1dc99455bdb6b462cf9436d9
SOURCE_DIR	= util-linux-2.32.1

default: build

include $(CURDIR)/../../mk/pkg.mk

bootstrap-two: fetch extract bootstrap-two-build install

bootstrap-two-build:
	cd $(BUILD_DIR) \
	&& ./configure \
		--prefix=/tools \
		--without-python \
		--disable-makeinstall-chown \
		--without-systemdsystemunitdir \
		--without-ncurses \
		PKG_CONFIG="" \
	&& make

build: fetch extract
	false

test:
	false

install:
	cd $(BUILD_DIR) && make install

.PHONY: default build test install
