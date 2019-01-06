# $FENRIR$
#
# Copyright © 2019, Colvin Wellborn All rights reserved.

PACKAGE		= diffutils
ARCHIVE		= diffutils-3.6.tar.xz
URL		= http://ftp.gnu.org/gnu/diffutils
CHECKSUM	= 07cf286672ced26fba54cd0313bdc071
SOURCE_DIR	= diffutils-3.6

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
