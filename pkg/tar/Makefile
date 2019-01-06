# $FENRIR$
#
# Copyright © 2019, Colvin Wellborn All rights reserved.

PACKAGE		= tar
ARCHIVE		= tar-1.30.tar.xz
URL		= http://ftp.gnu.org/gnu/tar
CHECKSUM	= 2d01c6cd1387be98f57a0ec4e6e35826
SOURCE_DIR	= tar-1.30

default: build

include $(CURDIR)/../../mk/pkg.mk

bootstrap-two: fetch extract bootstrap-two-build install

bootstrap-two-build:
	cd $(BUILD_DIR) \
	&& ./configure --prefix=/tools \
	&& make

build: fetch extract
	false

test:
	false

install:
	cd $(BUILD_DIR) && make install

.PHONY: default build test install
