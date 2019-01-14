# $FENRIR$
#
# Copyright © 2019, Colvin Wellborn All rights reserved.

PACKAGE		= python
ARCHIVE		= Python-3.7.0.tar.xz
URL		= https://www.python.org/ftp/python/3.7.0
CHECKSUM	= eb8c2a6b1447d50813c02714af4681f3
SOURCE_DIR	= Python-3.7.0

default: build install clean

include $(CURDIR)/../../mk/pkg.mk

build: chroot-check fetch extract
	cd $(BUILD_DIR) \
	&& ./configure \
		--prefix=/usr \
		--enable-shared \
		--with-system-expat \
		--with-system-ffi \
		--with-ensurepip=yes \
	&& make -j$(PKG_JOBS)

test:

install:
	cd $(BUILD_DIR) \
	&& make install \
	&& chmod 755 /usr/lib/libpython3.7m.so \
	&& chmod 755 /usr/lib/libpython3.so

.PHONY: default build test install
