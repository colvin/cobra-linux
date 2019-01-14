# $FENRIR$
#
# Copyright © 2019, Colvin Wellborn All rights reserved.

PACKAGE		= perl
ARCHIVE		= perl-5.28.0.tar.xz
URL		= https://www.cpan.org/src/5.0
CHECKSUM	= f3245183c0a08f65e94a3333995af08e
SOURCE_DIR	= perl-5.28.0

default: build install clean

include $(CURDIR)/../../mk/pkg.mk

bootstrap-two: fetch extract bootstrap-two-build-install

bootstrap-two-build-install:
	cd $(BUILD_DIR) \
	&& sh Configure \
		-des \
		-Dprefix=/tools \
		-Dlibs=-lm \
		-Uloclibpth \
		-Ulocincpth \
	&& make -j$(PKG_JOBS) \
	&& cp perl cpan/podlators/scripts/pod2man /tools/bin \
	&& mkdir -p /tools/lib/perl5/5.28.0 \
	&& cp -R lib/* /tools/lib/perl5/5.28.0

build: chroot-check fetch extract
	cd $(BUILD_DIR) \
	&& export BUILD_ZLIB=False \
	&& export BUILD_BZIP2=0 \
	&& sh Configure -des \
		-Dprefix=/usr \
		-Dvendorprefix=/usr \
		-Dman1dir=/usr/share/man/man1 \
		-Dman3dir=/usr/share/man/man3 \
		-Dpager="/usr/bin/less -isR" \
		-Duseshrplib \
		-Dusethreads \
	&& make -j$(PKG_JOBS)

test:
	cd $(BUILD_DIR) && make -k test

install:
	cd $(BUILD_DIR) && make install

.PHONY: default build test install
