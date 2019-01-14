# $FENRIR$
#
# Copyright © 2019, Colvin Wellborn All rights reserved.

PACKAGE		= gettext
ARCHIVE		= gettext-0.19.8.1.tar.xz
URL		= http://ftp.gnu.org/gnu/gettext
CHECKSUM	= df3f5690eaa30fd228537b00cb7b7590
SOURCE_DIR	= gettext-0.19.8.1

default: build install clean

include $(CURDIR)/../../mk/pkg.mk

bootstrap-two: fetch extract bootstrap-two-build-install

bootstrap-two-build-install:
	cd $(BUILD_DIR)/gettext-tools \
	&& EMACS="no" ./configure \
		--prefix=/tools \
		--disable-shared \
	&& $(MAKE) -C gnulib-lib \
	&& $(MAKE) -C intl pluralx.c \
	&& $(MAKE) -C src msgfmt \
	&& $(MAKE) -C src msgmerge \
	&& $(MAKE) -C src xgettext \
	&& cp src/{msgfmt,msgmerge,xgettext} /tools/bin

build: chroot-check fetch extract
	cd $(BUILD_DIR) \
	&& sed -i '/^TESTS =/d' gettext-runtime/tests/Makefile.in \
	&& sed -i 's/test-lock..EXEEXT.//' gettext-tools/gnulib-tests/Makefile.in \
	&& sed -e '/AppData/{N;N;p;s/\.appdata\./.metainfo./}' \
		-i gettext-tools/its/appdata.loc \
	&& ./configure \
		--prefix=/usr \
		--disable-static \
		--docdir=/usr/share/doc/gettext-0.19.8.1 \
	&& make -j$(PKG_JOBS)

test:
	cd $(BUILD_DIR) && make -j$(PKG_JOBS) check

install:
	cd $(BUILD_DIR) \
	&& make install \
	&& chmod 0755 /usr/lib/preloadable_libintl.so

.PHONY: default build test install
