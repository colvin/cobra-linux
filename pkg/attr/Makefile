# $FENRIR$
#
# Copyright © 2019, Colvin Wellborn All rights reserved.

PACKAGE		= attr
ARCHIVE		= attr-2.4.48.tar.gz
URL		= http://download.savannah.gnu.org/releases/attr
CHECKSUM	= bc1e5cb5c96d99b24886f1f527d3bb3d
SOURCE_DIR	= attr-2.4.48

default: build install postinstall clean

include $(CURDIR)/../../mk/pkg.mk

build: chroot-check fetch extract
	cd $(BUILD_DIR) \
	&& ./configure \
		--prefix=/usr \
		--disable-static \
		--sysconfdir=/etc \
		--docdir=/usr/share/doc/attr-2.4.48 \
	&& make -j$(PKG_JOBS)

test:
	cd $(BUILD_DIR) && make check

install:
	cd $(BUILD_DIR) && make install

postinstall:
	cd $(BUIL_DIR) \
	&& mv /usr/lib/libattr.so.* /lib \
	&& ln -sf ../../lib/$$(readlink /usr/lib/libattr.so) /usr/lib/libattr.so

.PHONY: default build test install
