# $FENRIR$
#
# Copyright (c) 2019, Colvin Wellborn All rights reserved.

PACKAGE		= sed
ARCHIVE		= sed-4.5.tar.xz
URL		= http://ftp.gnu.org/gnu/sed
CHECKSUM	= ade8f8c2c548bf41f74db2dcfc37e4e3
SOURCE_DIR	= sed-4.5

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
