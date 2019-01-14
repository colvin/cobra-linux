# $FENRIR$
#
# Copyright © 2019, Colvin Wellborn All rights reserved.

PACKAGE		= openssl
ARCHIVE		= openssl-1.1.0i.tar.gz
URL		= https://openssl.org/source
CHECKSUM	= 9495126aafd2659d357ea66a969c3fe1
SOURCE_DIR	= openssl-1.1.0i

default: build install clean

include $(CURDIR)/../../mk/pkg.mk

build: chroot-check fetch extract
	cd $(BUILD_DIR) \
	&& ./config \
		--prefix=/usr \
		--openssldir=/etc/ssl \
		--libdir=lib \
		shared \
		zlib-dynamic \
	&& make -j$(PKG_JOBS)

test:
	cd $(BUILD_DIR) && make test

install:
	cd $(BUILD_DIR) \
	&& sed -i '/INSTALL_LIBS/s/libcrypto.a libssl.a//' Makefile \
	&& make MANSUFFIX=ssl install

.PHONY: default build test install
