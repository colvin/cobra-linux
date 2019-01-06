# $FENRIR: pkg/dejagnu/Makefile 8b800ad0c3c6da18caa0053206ed595631f65d1d 2019-01-05T19:35:21-05:00 colvin $
#
# Copyright (c) 2019, Colvin Wellborn All rights reserved.

PACKAGE		= dejagnu
ARCHIVE		= dejagnu-1.6.1.tar.gz
URL		= http://ftp.gnu.org/gnu/dejagnu
CHECKSUM	= 2ac8405a4c7ca8611d004fe852966c6f
SOURCE_DIR	= dejagnu-1.6.1

default: build

include $(CURDIR)/../../mk/pkg.mk

bootstrap-two: fetch extract bootstrap-two-build install

bootstrap-two-build:
	cd $(BUILD_DIR) && ./configure --prefix=/tools

build: fetch extract
	false

test:
	false

install:
	cd $(BUILD_DIR) && make install

.PHONY: default build test install
