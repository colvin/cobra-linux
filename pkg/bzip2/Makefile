# $FENRIR$
#
# Copyright © 2019, Colvin Wellborn All rights reserved.

PACKAGE		= bzip2
ARCHIVE		= bzip2-1.0.6.tar.gz
URL		= http://anduin.linuxfromscratch.org/LFS
CHECKSUM	= 00b516f4704d4a7cb50a1d97e6e8e15b
SOURCE_DIR	= bzip2-1.0.6

default: build install clean

include $(CURDIR)/../../mk/pkg.mk

bootstrap-two: fetch extract bootstrap-two-build bootstrap-two-install

bootstrap-two-install:
	cd $(BUILD_DIR) && make PREFIX=/tools install

bootstrap-two-build: fetch extract
	cd $(BUILD_DIR) && make -j$(PKG_JOBS)

build: chroot-check fetch extract
	cd $(BUILD_DIR) \
	&& patch -Np1 -i $(CURDIR)/bzip2-1.0.6-install_docs-1.patch \
	&& sed -i 's@\(ln -s -f \)$$(PREFIX)/bin/@\1@' Makefile \
	&& sed -i "s@(PREFIX)/man@(PREFIX)/share/man@g" Makefile \
	&& make -f Makefile-libbz2_so \
	&& make clean \
	&& make -j$(PKG_JOBS)

test:
	true

install:
	cd $(BUILD_DIR) \
	&& make PREFIX=/usr install \
	&& cp bzip2-shared /bin/bzip2 \
	&& cp -a libbz2.so* /lib \
	&& ln -s ../../lib/libbz2.so.1.0 /usr/lib/libbz2.so \
	&& rm /usr/bin/{bunzip2,bzcat,bzip2} \
	&& ln -s bzip2 /bin/bunzip2 \
	&& ln -s bzip2 /bin/bzcat

.PHONY: default build test install
