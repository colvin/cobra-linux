# $COBRA$
#
# Copyright (c) 2019, Colvin Wellborn All rights reserved.

PACKAGE		= make
ARCHIVE		= make-4.2.1.tar.bz2
URL		= http://ftp.gnu.org/gnu/make
CHECKSUM	= 15b012617e7c44c0ed482721629577ac
SOURCE_DIR	= make-4.2.1

default: build

include $(CURDIR)/../../mk/pkg.mk

bootstrap-two: fetch extract bootstrap-two-build install

bootstrap-two-build:
	cd $(BUILD_DIR) \
	&& sed -i '211,217 d; 219,229 d; 232 d' glob/glob.c \
	&& ./configure --prefix=/tools --without-guile \
	&& make

build: fetch extract
	false

test:
	false

install:
	cd $(BUILD_DIR) && make install

.PHONY: default build test install
