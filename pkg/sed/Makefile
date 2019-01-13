# $FENRIR$
#
# Copyright © 2019, Colvin Wellborn All rights reserved.

PACKAGE		= sed
ARCHIVE		= sed-4.5.tar.xz
URL		= http://ftp.gnu.org/gnu/sed
CHECKSUM	= ade8f8c2c548bf41f74db2dcfc37e4e3
SOURCE_DIR	= sed-4.5

default: build install clean

include $(CURDIR)/../../mk/pkg.mk

bootstrap-two: fetch extract bootstrap-two-build install

bootstrap-two-build:
	cd $(BUILD_DIR) \
	&& ./configure --prefix=/tools \
	&& make -j$(PKG_JOBS)

build: chroot-check fetch extract
	cd $(BUILD_DIR) \
	&& sed -i 's/usr/tools/' build-aux/help2man \
	&& sed -i 's/testsuite.panic-tests.sh//' Makefile.in \
	&& ./configure \
		--prefix=/usr \
		--bindir=/bin \
	&& make -j$(PKG_JOBS)

test:
	cd $(BUILD_DIR) && make check

install:
	cd $(BUILD_DIR) && make install

.PHONY: default build test install
