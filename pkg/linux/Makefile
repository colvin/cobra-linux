# $FENRIR$
#
# Copyright © 2019, Colvin Wellborn All rights reserved.

PACKAGE		= linux
ARCHIVE		= linux-4.18.5.tar.xz
URL		= https://www.kernel.org/pub/linux/kernel/v4.x
CHECKSUM	= 22851fe6c82db6673a844bbb7c62df67
SOURCE_DIR	= linux-4.18.5

default: build install clean

include $(CURDIR)/../../mk/pkg.mk

bootstrap-one: fetch extract bootstrap-one-build-install

bootstrap-one-build-install:
	cd $(BUILD_DIR) \
	&& make mrproper \
	&& make INSTALL_HDR_PATH=dest headers_install \
	&& cp -r dest/include/* /tools/include

build: chroot-check fetch extract
	cd $(BUILD_DIR) \
	&& make mrproper \
	&& make INSTALL_HDR_PATH=dest headers_install \
	&& find dest/include \( -name .install -o -name ..install.cmd \) -delete

test:
	false

install:
	cd $(BUILD_DIR) \
	&& cp -r dest/include/* /usr/include

.PHONY: default build test install
