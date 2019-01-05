# $CCL$
#
# Copyright (c) 2019, Colvin Wellborn All rights reserved.

PACKAGE		= tcl
ARCHIVE		= tcl8.6.8-src.tar.gz
URL		= https://downloads.sourceforge.net/tcl
CHECKSUM	= 81656d3367af032e0ae6157eff134f89
SOURCE_DIR	= tcl8.6.8

default: build

include $(CURDIR)/../../mk/pkg.mk

bootstrap-two: fetch extract bootstrap-two-build install bootstrap-two-postinstall

bootstrap-two-build:
	cd $(BUILD_DIR)/unix \
	&& ./configure --prefix=/tools \
	&& make

bootstrap-two-postinstall:
	cd $(BUILD_DIR)/unix \
	&& chmod u+w /tools/lib/libtcl8.6.so \
	&& make install-private-headers

build: fetch extract
	false

test:
	false

install:
	cd $(BUILD_DIR)/unix \
	&& make install \
	&& ln -sv tclsh8.6 /tools/bin/tclsh

.PHONY: default build test install
