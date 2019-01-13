# $FENRIR$
#
# Copyright © 2019, Colvin Wellborn All rights reserved.

PACKAGE		= flex
ARCHIVE		= flex-2.6.4.tar.gz
URL		= https://github.com/westes/flex/releases/download/v2.6.4
CHECKSUM	= 2882e3179748cc9f9c23ec593d6adc8d
SOURCE_DIR	= flex-2.6.4

default: build install clean

include $(CURDIR)/../../mk/pkg.mk

build: chroot-check fetch extract
	cd $(BUILD_DIR) \
	&& sed -i "/math.h/a #include <malloc.h>" src/flexdef.h \
	&& HELP2MAN=/tools/bin/true ./configure \
		--prefix=/usr \
		--docdir=/usr/share/doc/flex-2.6.4 \
	&& make -j$(PKG_JOBS)

test:
	cd $(BUILD_DIR) && make check

install:
	cd $(BUILD_DIR) && make install
	ln -s flex /usr/bin/lex

.PHONY: default build test install
