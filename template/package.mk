# $FENRIR$
#
# Copyright © 2019, Colvin Wellborn All rights reserved.

PACKAGE		= REPLACE_PACKAGE
ARCHIVE		= REPLACE_ARCHIVE
URL		= REPLACE_URL
CHECKSUM	= REPLACE_CHECKSUM
SOURCE_DIR	= REPLACE_SOURCE_DIR

default: build

include $(CURDIR)/../../mk/pkg.mk

build: chroot-check fetch extract

test:

install:

.PHONY: default build test install
