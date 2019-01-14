# $FENRIR$
#
# Copyright © 2019, Colvin Wellborn All rights reserved.

PACKAGE		= autoconf
ARCHIVE		= autoconf-2.69.tar.xz
URL		= http://ftp.gnu.org/gnu/autoconf
CHECKSUM	= 50f97f4159805e374639a73e2636f22e
SOURCE_DIR	= autoconf-2.69

default: build install clean

include $(CURDIR)/../../mk/pkg.mk

build: chroot-check fetch extract
	cd $(BUILD_DIR) \
	&& ./configure --prefix=/usr \
	&& make -j$(PKG_JOBS)

test:
	cd $(BUILD_DIR) && make check TESTSUITEFLAGS=-j$(PKG_JOBS)

install:
	cd $(BUILD_DIR) && make install

.PHONY: default build test install
