# $FENRIR$
#
# Copyright © 2019, Colvin Wellborn All rights reserved.

PACKAGE		= iana-etc
ARCHIVE		= iana-etc-2.30.tar.bz2
URL		= http://anduin.linuxfromscratch.org/LFS
CHECKSUM	= 3ba3afb1d1b261383d247f46cb135ee8
SOURCE_DIR	= iana-etc-2.30

default: build install clean

include $(CURDIR)/../../mk/pkg.mk

build: chroot-check fetch extract
	cd $(BUILD_DIR) && make

test:

install:
	cd $(BUILD_DIR) && make install

.PHONY: default build test install
