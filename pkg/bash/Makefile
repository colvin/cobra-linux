# $FENRIR: pkg/bash/Makefile 8b800ad0c3c6da18caa0053206ed595631f65d1d 2019-01-05T19:35:21-05:00 colvin $
#
# Copyright (c) 2019, Colvin Wellborn All rights reserved.

PACKAGE		= bash
ARCHIVE		= bash-4.4.18.tar.gz
URL		= http://ftp.gnu.org/gnu/bash
CHECKSUM	= 518e2c187cc11a17040f0915dddce54e
SOURCE_DIR	= bash-4.4.18

default: build

include $(CURDIR)/../../mk/pkg.mk

bootstrap-two: fetch extract bootstrap-two-build install bootstrap-two-postinstall

bootstrap-two-build:
	cd $(BUILD_DIR) \
	&& ./configure --prefix=/tools --without-bash-malloc \
	&& make

bootstrap-two-postinstall:
	ln -s bash /tools/bin/sh

build: fetch extract
	false

test:
	false

install:
	cd $(BUILD_DIR) && make install

.PHONY: default build test install
