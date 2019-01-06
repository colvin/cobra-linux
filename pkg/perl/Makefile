# $FENRIR$
#
# Copyright © 2019, Colvin Wellborn All rights reserved.

PACKAGE		= perl
ARCHIVE		= perl-5.28.0.tar.xz
URL		= https://www.cpan.org/src/5.0
CHECKSUM	= f3245183c0a08f65e94a3333995af08e
SOURCE_DIR	= perl-5.28.0

default: build

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

build: fetch extract
	false

test:
	false

install:
	false

.PHONY: default build test install
