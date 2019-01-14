# $FENRIR$
#
# Copyright © 2019, Colvin Wellborn All rights reserved.

PACKAGE		= xz
ARCHIVE		= xz-5.2.4.tar.xz
URL		= https://tukaani.org/xz
CHECKSUM	= 003e4d0b1b1899fc6e3000b24feddf7c
SOURCE_DIR	= xz-5.2.4

default: build install postinstall clean

include $(CURDIR)/../../mk/pkg.mk

bootstrap-two: fetch extract bootstrap-two-build install

bootstrap-two-build:
	cd $(BUILD_DIR) \
	&& ./configure --prefix=/tools \
	&& make -j$(PKG_JOBS)

build: chroot-check fetch extract
	cd $(BUILD_DIR) \
	&& ./configure \
		--prefix=/usr \
		--disable-static \
		--docdir=/usr/share/doc/xz-5.2.4 \
	&& make -j$(PKG_JOBS)

test:
	cd $(BUILD_DIR) && make check

install:
	cd $(BUILD_DIR) && make install

postinstall:
	cd $(BUILD_DIR) \
	&& mv /usr/bin/{lzma,unlzma,lzcat,xz,unxz,xzcat} /bin \
	&& mv /usr/lib/liblzma.so.* /lib \
	&& ln -sf ../../lib/$$(readlink /usr/lib/liblzma.so) /usr/lib/liblzma.so

.PHONY: default build test install
