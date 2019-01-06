# $FENRIR$
#
# Copyright © 2019, Colvin Wellborn All rights reserved.

PACKAGE		= bzip2
ARCHIVE		= bzip2-1.0.6.tar.gz
URL		= http://anduin.linuxfromscratch.org/LFS
CHECKSUM	= 00b516f4704d4a7cb50a1d97e6e8e15b
SOURCE_DIR	= bzip2-1.0.6

default: build

include $(CURDIR)/../../mk/pkg.mk

bootstrap-two: fetch extract build bootstrap-two-install

bootstrap-two-install:
	cd $(BUILD_DIR) && make PREFIX=/tools install

build: fetch extract
	cd $(BUILD_DIR) && make -j$(PKG_JOBS)

test:

install:

.PHONY: default build test install
