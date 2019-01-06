# $FENRIR: pkg/ncurses/Makefile 8b800ad0c3c6da18caa0053206ed595631f65d1d 2019-01-05T19:35:21-05:00 colvin $
#
# Copyright (c) 2019, Colvin Wellborn All rights reserved.

PACKAGE		= ncurses
ARCHIVE		= ncurses-6.1.tar.gz
URL		= http://ftp.gnu.org/gnu/ncurses
CHECKSUM	= 98c889aaf8d23910d2b92d65be2e737a
SOURCE_DIR	= ncurses-6.1

default: build

include $(CURDIR)/../../mk/pkg.mk

bootstrap-two: fetch extract bootstrap-two-build install

bootstrap-two-build:
	cd $(BUILD_DIR) \
	&& sed -i s/mawk// configure \
	&& ./configure \
		--prefix=/tools \
		--with-shared \
		--without-debug \
		--without-ada \
		--enable-widec \
		--enable-overwrite \
	&& make

build: fetch extract
	false

test:
	false

install:
	cd $(BUILD_DIR) && make install

.PHONY: default build test install
