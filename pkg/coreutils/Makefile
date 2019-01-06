# $FENRIR$
#
# Copyright (c) 2019, Colvin Wellborn All rights reserved.

PACKAGE		= coreutils
ARCHIVE		= coreutils-8.30.tar.xz
URL		= http://ftp.gnu.org/gnu/coreutils
CHECKSUM	= ab06d68949758971fe744db66b572816
SOURCE_DIR	= coreutils-8.30

default: build

include $(CURDIR)/../../mk/pkg.mk

bootstrap-two: fetch extract bootstrap-two-build install

bootstrap-two-build:
	cd $(BUILD_DIR) \
	&& ./configure \
		--prefix=/tools \
		--enable-install-program=hostname \
	&& make

build: fetch extract
	false

test:
	false

install:
	cd $(BUILD_DIR) && make install

.PHONY: default build test install
