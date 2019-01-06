# $FENRIR$
#
# Copyright © 2019, Colvin Wellborn All rights reserved.

PACKAGE		= bison
ARCHIVE		= bison-3.0.5.tar.xz
URL		= http://ftp.gnu.org/gnu/bison
CHECKSUM	= 3e54f20988ecd1b62044e25481e5f06b
SOURCE_DIR	= bison-3.0.5

default: build

include $(CURDIR)/../../mk/pkg.mk

bootstrap-two: fetch extract bootstrap-two-build install

bootstrap-two-build:
	cd $(BUILD_DIR) \
	&& ./configure --prefix=/tools \
	&& make -j$(PKG_JOBS)

build: fetch extract
	false

test:
	false

install:
	cd $(BUILD_DIR) && make install

.PHONY: default build test install
