# $FENRIR$
#
# Copyright © 2019, Colvin Wellborn All rights reserved.

PACKAGE		= libcxx
VERSION		= 8.2.0
ARCHIVE		= gcc-$(VERSION).tar.xz
URL		= http://ftp.gnu.org/gnu/gcc/gcc-$(VERSION)
CHECKSUM	= 4ab282f414676496483b3e1793d07862
SOURCE_DIR	= gcc-$(VERSION)

default: build

include $(CURDIR)/../../mk/pkg.mk

bootstrap-one: fetch extract bootstrap-one-build install

bootstrap-one-build:
	mkdir $(WORK_DIR)/$(SOURCE_DIR)/build
	cd $(WORK_DIR)/$(SOURCE_DIR)/build \
	&& ../libstdc++-v3/configure \
		--host=$(BOOTSTRAP_TGT) \
		--prefix=/tools \
		--disable-multilib \
		--disable-nls \
		--disable-libstdcxx-threads \
		--disable-libstdcxx-pch \
		--with-gxx-include-dir=/tools/$(BOOTSTRAP_TGT)/include/c++/$(VERSION) \
	&& make -j$(PKG_JOBS)

build: fetch extract
	false

test:
	false

install:
	cd $(WORK_DIR)/$(SOURCE_DIR)/build && make install

.PHONY: default build test install
