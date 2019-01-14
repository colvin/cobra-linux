# $FENRIR$
#
# Copyright © 2019, Colvin Wellborn All rights reserved.

PACKAGE		= libffi
ARCHIVE		= libffi-3.2.1.tar.gz
URL		= ftp://sourceware.org/pub/libffi
CHECKSUM	= 83b89587607e3eb65c70d361f13bab43
SOURCE_DIR	= libffi-3.2.1

default: build install clean

include $(CURDIR)/../../mk/pkg.mk

build: chroot-check fetch extract
	cd $(BUILD_DIR) \
	&& sed -e '/^includesdir/ s/$$(libdir).*$$/$$(includedir)/' \
		-i include/Makefile.in \
	&& sed -e '/^includedir/ s/=.*$$/=@includedir@/' \
		-e 's/^Cflags: -I$${includedir}/Cflags:/' \
		-i libffi.pc.in \
	&& ./configure \
		--prefix=/usr \
		--disable-static \
		--with-gcc-arch=native \
	&& make -j$(PKG_JOBS)

test:
	cd $(BUILD_DIR) && make check

install:
	cd $(BUILD_DIR) && make install

.PHONY: default build test install
