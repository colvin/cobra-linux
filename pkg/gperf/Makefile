# $FENRIR$
#
# Copyright © 2019, Colvin Wellborn All rights reserved.

PACKAGE		= gperf
ARCHIVE		= gperf-3.1.tar.gz
URL		= http://ftp.gnu.org/gnu/gperf
CHECKSUM	= 9e251c0a618ad0824b51117d5d9db87e
SOURCE_DIR	= gperf-3.1

default: build install clean

include $(CURDIR)/../../mk/pkg.mk

build: chroot-check fetch extract
	cd $(BUILD_DIR) \
	&& ./configure \
		--prefix=/usr \
		--docdir=/usr/share/doc/gperf-3.1 \
	&& make -j$(PKG_JOBS)

test:
	cd $(BUILD_DIR) && make -j1 check

install:
	cd $(BUILD_DIR) && make install

.PHONY: default build test install
