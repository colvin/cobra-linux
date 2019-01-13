# $FENRIR$
#
# Copyright © 2019, Colvin Wellborn All rights reserved.

PACKAGE		= acl
ARCHIVE		= acl-2.2.53.tar.gz
URL		= http://download.savannah.gnu.org/releases/acl
CHECKSUM	= 007aabf1dbb550bcddde52a244cd1070
SOURCE_DIR	= acl-2.2.53

default: build install clean

include $(CURDIR)/../../mk/pkg.mk

build: chroot-check fetch extract
	cd $(BUILD_DIR) \
	&& ./configure \
		--prefix=/usr \
		--disable-static \
		--libexecdir=/usr/lib \
		--docdir=/usr/share/doc/acl-2.2.53 \
	&& make -j$(PKG_JOBS)

test:

install:
	cd $(BUILD_DIR) && make install

postinstall:
	cd $(BULID_DIR) \
	&& mv -v /usr/lib/libacl.so.* /lib \
	&& ln -sfv ../../lib/$$(readlink /usr/lib/libacl.so) /usr/lib/libacl.so

.PHONY: default build test install
