# $FENRIR$
#
# Copyright © 2019, Colvin Wellborn All rights reserved.

PACKAGE		= gmp
ARCHIVE		= gmp-6.1.2.tar.xz
URL		= http://ftp.gnu.org/gnu/gmp
CHECKSUM	= f58fa8001d60c4c77595fbbb62b63c1d
SOURCE_DIR	= gmp-6.1.2

default: build test install clean

include $(CURDIR)/../../mk/pkg.mk

build: chroot-check fetch extract
	cd $(BUILD_DIR) \
	&& ./configure \
		--prefix=/usr \
		--enable-cxx \
		--disable-static \
		--docdir=/usr/share/doc/gmp-6.1.2 \
	&& make -j$(PKG_JOBS)

test:
	cd $(BUILD_DIR) && make check 2>&1 | tee gmp-check-log \
	&& test `awk '/# PASS:/{total+=$$3} ; END{print total}' gmp-check-log` = '190'

install:
	cd $(BUILD_DIR) && make install

.PHONY: default build test install
