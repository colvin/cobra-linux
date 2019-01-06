# $FENRIR: pkg/gettext/Makefile 8b800ad0c3c6da18caa0053206ed595631f65d1d 2019-01-05T19:35:21-05:00 colvin $
#
# Copyright (c) 2019, Colvin Wellborn All rights reserved.

PACKAGE		= gettext
ARCHIVE		= gettext-0.19.8.1.tar.xz
URL		= http://ftp.gnu.org/gnu/gettext
CHECKSUM	= df3f5690eaa30fd228537b00cb7b7590
SOURCE_DIR	= gettext-0.19.8.1

default: build

include $(CURDIR)/../../mk/pkg.mk

bootstrap-two: fetch extract bootstrap-two-build-install

bootstrap-two-build-install:
	cd $(BUILD_DIR)/gettext-tools \
	&& EMACS="no" ./configure \
		--prefix=/tools \
		--disable-shared \
	&& $(MAKE) -C gnulib-lib \
	&& $(MAKE) -C intl pluralx.c \
	&& $(MAKE) -C src msgfmt \
	&& $(MAKE) -C src msgmerge \
	&& $(MAKE) -C src xgettext \
	&& cp src/{msgfmt,msgmerge,xgettext} /tools/bin

build: fetch extract
	false

test:
	false

install:
	false

.PHONY: default build test install
