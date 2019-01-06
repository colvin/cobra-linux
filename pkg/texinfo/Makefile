# $FENRIR: pkg/texinfo/Makefile 8b800ad0c3c6da18caa0053206ed595631f65d1d 2019-01-05T19:35:21-05:00 colvin $
#
# Copyright (c) 2019, Colvin Wellborn All rights reserved.

PACKAGE		= texinfo
ARCHIVE		= texinfo-6.5.tar.xz
URL		= http://ftp.gnu.org/gnu/texinfo
CHECKSUM	= 3715197e62e0e07f85860b3d7aab55ed
SOURCE_DIR	= texinfo-6.5

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
