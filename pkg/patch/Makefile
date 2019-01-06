# $FENRIR$
#
# Copyright (c) 2019, Colvin Wellborn All rights reserved.

PACKAGE		= patch
ARCHIVE		= patch-2.7.6.tar.xz
URL		= http://ftp.gnu.org/gnu/patch
CHECKSUM	= 78ad9937e4caadcba1526ef1853730d5
SOURCE_DIR	= patch-2.7.6

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
