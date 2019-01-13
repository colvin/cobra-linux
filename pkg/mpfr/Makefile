# $FENRIR$
#
# Copyright © 2019, Colvin Wellborn All rights reserved.

PACKAGE		= mpfr
ARCHIVE		= mpfr-4.0.1.tar.xz
URL		= http://www.mpfr.org/mpfr-4.0.1
CHECKSUM	= b8dd19bd9bb1ec8831a6a582a7308073
SOURCE_DIR	= mpfr-4.0.1

default: build test install clean

include $(CURDIR)/../../mk/pkg.mk

build: chroot-check fetch extract
	cd $(BUILD_DIR)\
	&& ./configure \
		--prefix=/usr \
		--disable-static \
		--enable-thread-safe \
		--docdir=/usr/share/doc/mpfr-4.0.1 \
	&& make -j$(PKG_JOBS)

test:
	cd $(BUILD_DIR) && make check

install:
	cd $(BUILD_DIR) && make install

.PHONY: default build test install
