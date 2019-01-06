# $FENRIR$
#
# Copyright © 2019, Colvin Wellborn All rights reserved.

PACKAGE		= man-pages
ARCHIVE		= man-pages-4.16.tar.xz
URL		= https://www.kernel.org/pub/linux/docs/man-pages
CHECKSUM	= ad9f1ff81276fe8d90d077484d6d4b5e
SOURCE_DIR	= man-pages-4.16

default: build

include $(CURDIR)/../../mk/pkg.mk

build: chroot-check fetch extract
	true

test:
	false

install:
	make install

.PHONY: default build test install
