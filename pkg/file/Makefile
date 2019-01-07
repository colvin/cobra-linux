# $FENRIR$
#
# Copyright © 2019, Colvin Wellborn All rights reserved.

PACKAGE		= file
ARCHIVE		= file-5.34.tar.gz
URL		= ftp://ftp.astron.com/pub/file
CHECKSUM	= 44b0b6983462b18f96403d4d3ad80254
SOURCE_DIR	= file-5.34

default: build install clean

include $(CURDIR)/../../mk/pkg.mk

bootstrap-two: fetch extract bootstrap-two-build install

bootstrap-two-build:
	cd $(BUILD_DIR) \
	&& ./configure --prefix=/tools \
	&& make -j$(PKG_JOBS)

build: chroot-check fetch extract
	cd $(BUILD_DIR) \
	&& ./configure --prefix=/usr \
	&& make -j$(PKG_JOBS)

test:
	cd $(BUILD_DIR) && make check

install:
	cd $(BUILD_DIR) && make install

.PHONY: default build test install
