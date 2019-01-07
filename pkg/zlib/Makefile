# $FENRIR$
#
# Copyright © 2019, Colvin Wellborn All rights reserved.

PACKAGE		= zlib
ARCHIVE		= zlib-1.2.11.tar.xz
URL		= https://zlib.net
CHECKSUM	= 85adef240c5f370b308da8c938951a68
SOURCE_DIR	= zlib-1.2.11

default: build install clean

include $(CURDIR)/../../mk/pkg.mk

build: chroot-check fetch extract
	cd $(BUILD_DIR) \
	&& ./configure --prefix=/usr \
	&& make -j$(PKG_JOBS)

test:
	cd $(BUILD_DIR) && make check

install:
	cd $(BUILD_DIR) && make install
	mv /usr/lib/libz.so.* /lib
	ln -sf ../../lib/$$(readlink /usr/lib/libz.so) /usr/lib/libz.so

.PHONY: default build test install
