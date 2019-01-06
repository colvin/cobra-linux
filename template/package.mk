# $FENRIR$
#
# Copyright © 2019, Colvin Wellborn All rights reserved.

PACKAGE		= REPLACE_PACKAGE
ARCHIVE		= REPLACE_ARCHIVE
URL		= REPLACE_URL
CHECKSUM	= REPLACE_CHECKSUM
SOURCE_DIR	= REPLACE_SOURCE_DIR

default: build install clean

include $(CURDIR)/../../mk/pkg.mk

build: chroot-check fetch extract
	false

test:
	false

install:
	false

.PHONY: default build test install
