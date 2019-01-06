# $FENRIR: pkg/file/Makefile 8b800ad0c3c6da18caa0053206ed595631f65d1d 2019-01-05T19:35:21-05:00 colvin $
#
# Copyright (c) 2019, Colvin Wellborn All rights reserved.

PACKAGE		= file
ARCHIVE		= file-5.34.tar.gz
URL		= ftp://ftp.astron.com/pub/file
CHECKSUM	= 44b0b6983462b18f96403d4d3ad80254
SOURCE_DIR	= file-5.34

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
