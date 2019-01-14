# $FENRIR$
#
# Copyright © 2019, Colvin Wellborn All rights reserved.

PACKAGE		= kmod
ARCHIVE		= kmod-25.tar.xz
URL		= https://www.kernel.org/pub/linux/utils/kernel/kmod
CHECKSUM	= 34f325cab568f842fdde4f8b2182f220
SOURCE_DIR	= kmod-25

default: build install clean

include $(CURDIR)/../../mk/pkg.mk

build: chroot-check fetch extract
	cd $(BUILD_DIR) \
	&& ./configure \
		--prefix=/usr \
		--bindir=/bin \
		--sysconfdir=/etc \
		--with-rootlibdir=/lib \
		--with-xz \
		--with-zlib \
	&& make -j$(PKG_JOBS)

test:

install:
	cd $(BUILD_DIR) \
	&& make install \
	&& for target in depmod insmod lsmod modinfo modprobe rmmod; do \
		ls -sf ../bin/kmod /sbin/$$target ; \
	done \
	&& ln -sf kmod /bin/lsmod

.PHONY: default build test install
