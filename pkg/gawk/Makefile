# $FENRIR$
#
# Copyright © 2019, Colvin Wellborn All rights reserved.

PACKAGE		= gawk
ARCHIVE		= gawk-4.2.1.tar.xz
URL		= http://ftp.gnu.org/gnu/gawk
CHECKSUM	= 95cf553f50ec9f386b5dfcd67f30180a
SOURCE_DIR	= gawk-4.2.1

default: build

include $(CURDIR)/../../mk/pkg.mk

bootstrap-two: fetch extract bootstrap-two-build install

bootstrap-two-build:
	cd $(BUILD_DIR) \
	&& ./configure --prefix=/tools \
	&& make -j$(PKG_JOBS)

build: fetch extract
	false

test:
	false

install:
	cd $(BUILD_DIR) && make install

.PHONY: default build test install
