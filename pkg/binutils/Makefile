# $CCL$
#
# Copyright (c) 2019, Colvin Wellborn All rights reserved.

PACKAGE		= binutils
ARCHIVE		= binutils-2.31.1.tar.xz
URL		= http://ftp.gnu.org/gnu/binutils
CHECKSUM	= 5b7c9d4ce96f507d95c1b9a255e52418
SOURCE_DIR	= binutils-2.31.1

default: build

include $(CURDIR)/../../mk/pkg.mk

bootstrap-one: fetch extract bootstrap-one-build install

bootstrap-one-build:
	mkdir $(BUILD_DIR)/build
	cd $(BUILD_DIR)/build \
	&& ../configure \
		--prefix=/tools \
		--with-sysroot=$(BUILD_ROOT) \
		--with-lib-path=/tools/lib \
		--target=$(BOOTSTRAP_TGT) \
		--disable-nls \
		--disable-werror \
	&& make \
	&& mkdir -v /tools/lib \
	&& ln -sv lib /tools/lib64

bootstrap-two: fetch extract bootstrap-two-build install bootstrap-two-postinstall

bootstrap-two-build:
	mkdir $(BUILD_DIR)/build
	cd $(BUILD_DIR)/build \
	&& CC=$(BOOTSTRAP_TGT)-gcc \
	AR=$(BOOTSTRAP_TGT)-ar \
	RANLIB=$(BOOTSTRAP_TGT)-ranlib \
	../configure \
		--prefix=/tools \
		--disable-nls \
		--disable-werror \
		--with-lib-path=/tools/lib \
		--with-sysroot \
	&& make

bootstrap-two-postinstall:
	cd $(BUILD_DIR)/build \
	&& make -C ld clean \
	&& make -C ld LIB_PATH=/usr/lib:/lib \
	&& cp ld/ld-new /tools/bin

build: fetch extract
	false

test:
	false

install:
	cd $(BUILD_DIR)/build && make install

.PHONY: default build test install
