# $FENRIR: pkg/expect/Makefile 8b800ad0c3c6da18caa0053206ed595631f65d1d 2019-01-05T19:35:21-05:00 colvin $
#
# Copyright (c) 2019, Colvin Wellborn All rights reserved.

PACKAGE		= expect
ARCHIVE		= expect5.45.4.tar.gz
URL		= https://prdownloads.sourceforge.net/expect
CHECKSUM	= 00fce8de158422f5ccd2666512329bd2
SOURCE_DIR	= expect5.45.4

default: build

include $(CURDIR)/../../mk/pkg.mk

bootstrap-two: fetch extract bootstrap-two-build bootstrap-two-install

bootstrap-two-build:
	cd $(BUILD_DIR) \
	&& cp configure{,.orig} \
	&& sed 's:/usr/local/bin:/bin:' configure.orig > configure \
	&& ./configure \
		--prefix=/tools \
		--with-tcl=/tools/lib \
		--with-tclinclude=/tools/include \
	&& make

bootstrap-two-install:
	cd $(BUILD_DIR) && make SCRIPTS="" install

build: fetch extract
	false

test:
	false

install:
	false

.PHONY: default build test install
