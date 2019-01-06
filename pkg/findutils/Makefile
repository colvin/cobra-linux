# $FENRIR: pkg/findutils/Makefile 8b800ad0c3c6da18caa0053206ed595631f65d1d 2019-01-05T19:35:21-05:00 colvin $
#
# Copyright (c) 2019, Colvin Wellborn All rights reserved.

PACKAGE		= findutils
ARCHIVE		= findutils-4.6.0.tar.gz
URL		= http://ftp.gnu.org/gnu/findutils
CHECKSUM	= 9936aa8009438ce185bea2694a997fc1
SOURCE_DIR	= findutils-4.6.0

default: build

include $(CURDIR)/../../mk/pkg.mk

bootstrap-two: fetch extract bootstrap-two-build install

bootstrap-two-build:
	cd $(BUILD_DIR) \
	&& sed -i 's/IO_ftrylockfile/IO_EOF_SEEN/' gl/lib/*.c \
	&& sed -i '/unistd/a #include <sys/sysmacros.h>' gl/lib/mountlist.c \
	&& echo "#define _IO_IN_BACKUP 0x100" >> gl/lib/stdio-impl.h \
	&& ./configure --prefix=/tools \
	&& make

build: fetch extract
	false

test:
	false

install:
	cd $(BUILD_DIR) && make install

.PHONY: default build test install
