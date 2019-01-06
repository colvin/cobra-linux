# $FENRIR: pkg/gzip/Makefile 8b800ad0c3c6da18caa0053206ed595631f65d1d 2019-01-05T19:35:21-05:00 colvin $
#
# Copyright (c) 2019, Colvin Wellborn All rights reserved.

PACKAGE		= gzip
ARCHIVE		= gzip-1.9.tar.xz
URL		= http://ftp.gnu.org/gnu/gzip
CHECKSUM	= 9492c6ccb2239ff679a5475a7bb543ed
SOURCE_DIR	= gzip-1.9

default: build

include $(CURDIR)/../../mk/pkg.mk

bootstrap-two: fetch extract bootstrap-two-build install

bootstrap-two-build:
	cd $(BUILD_DIR) \
	&& sed -i 's/IO_ftrylockfile/IO_EOF_SEEN/' lib/*.c \
	&& echo "#define _IO_IN_BACKUP 0x100" >> lib/stdio-impl.h \
	&& ./configure --prefix=/tools \
	&& make

build: fetch extract
	false

test:
	false

install:
	cd $(BUILD_DIR) && make install

.PHONY: default build test install
