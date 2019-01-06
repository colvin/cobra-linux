# $FENRIR: pkg/xz/Makefile 8b800ad0c3c6da18caa0053206ed595631f65d1d 2019-01-05T19:35:21-05:00 colvin $
#
# Copyright (c) 2019, Colvin Wellborn All rights reserved.

PACKAGE		= xz
ARCHIVE		= xz-5.2.4.tar.xz
URL		= https://tukaani.org/xz
CHECKSUM	= 003e4d0b1b1899fc6e3000b24feddf7c
SOURCE_DIR	= xz-5.2.4

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
