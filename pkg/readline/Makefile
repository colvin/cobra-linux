# $FENRIR$
#
# Copyright © 2019, Colvin Wellborn All rights reserved.

PACKAGE		= readline
ARCHIVE		= readline-7.0.tar.gz
URL		= http://ftp.gnu.org/gnu/readline
CHECKSUM	= 205b03a87fc83dab653b628c59b9fc91
SOURCE_DIR	= readline-7.0

default: build install clean

include $(CURDIR)/../../mk/pkg.mk

build: chroot-check fetch extract
	cd $(BUILD_DIR) \
	&& sed -i '/MV.*old/d' Makefile.in \
	&& sed -i '/{OLDSUFF}/c:' support/shlib-install \
	&& ./configure \
		--prefix=/usr \
		--disable-static \
		--docdir=/usr/share/doc/readline-7.0 \
	&& make -j$(PKG_JOBS) SHLIB_LIBS="-L/tools/lib -lncursesw"

test:
	true

install:
	cd $(BUILD_DIR) \
	&& make SHLIB_LIBS="-L/tools/lib -lncurses" install \
	&& mv -v /usr/lib/lib{readline,history}.so.* /lib \
	&& chmod -v u+w /lib/lib{readline,history}.so.* \
	&& ln -sfv ../../lib/$$(readlink /usr/lib/libreadline.so) /usr/lib/libreadline.so \
	&& ln -sfv ../../lib/$$(readlink /usr/lib/libhistory.so ) /usr/lib/libhistory.so

.PHONY: default build test install
