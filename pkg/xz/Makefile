# $COBRA$
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
