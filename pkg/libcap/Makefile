# $FENRIR$
#
# Copyright © 2019, Colvin Wellborn All rights reserved.

PACKAGE		= libcap
ARCHIVE		= libcap-2.25.tar.xz
URL		= https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2
CHECKSUM	= 6666b839e5d46c2ad33fc8aa2ceb5f77
SOURCE_DIR	= libcap-2.25

default: build install postinstall clean

include $(CURDIR)/../../mk/pkg.mk

build: chroot-check fetch extract
	cd $(BUILD_DIR) \
	&& sed -i '/install.*STALIBNAME/d' libcap/Makefile \
	&& make -j$(PKG_JOBS)

test:

install:
	cd $(BUILD_DIR) \
	&& make RAISE_SETFCAP=no lib=lib prefix=/usr install \

postinstall:
	cd $(BUILD_DIR) \
	&& chmod 755 /usr/lib/libcap.so \
	&& mv /usr/lib/libcap.so.* /lib \
	&& ln -sf ../../lib/$$(readlink /usr/lib/libcap.so) /usr/lib/libcap.so

.PHONY: default build test install
