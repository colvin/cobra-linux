# $FENRIR$
#
# Copyright © 2019, Colvin Wellborn All rights reserved.

PACKAGE		= ncurses
ARCHIVE		= ncurses-6.1.tar.gz
URL		= http://ftp.gnu.org/gnu/ncurses
CHECKSUM	= 98c889aaf8d23910d2b92d65be2e737a
SOURCE_DIR	= ncurses-6.1

default: build install postinstall clean

include $(CURDIR)/../../mk/pkg.mk

bootstrap-two: fetch extract bootstrap-two-build install

bootstrap-two-build:
	cd $(BUILD_DIR) \
	&& sed -i s/mawk// configure \
	&& ./configure \
		--prefix=/tools \
		--with-shared \
		--without-debug \
		--without-ada \
		--enable-widec \
		--enable-overwrite \
	&& make -j$(PKG_JOBS)

build: chroot-check fetch extract
	cd $(BUILD_DIR) \
	&& sed -i '/LIBTOOL_INSTALL/d' c++/Makefile.in \
	&& ./configure \
		--prefix=/usr \
		--mandir=/usr/share/man \
		--with-shared \
		--without-debug \
		--without-normal \
		--enable-pc-files \
		--enable-widec \
	&& make -j$(PKG_JOBS)

test:
	true

install:
	cd $(BUILD_DIR) && make install

postinstall:
	cd $(BUILD_DIR) \
	&& mv /usr/lib/libncursesw.so.6* /lib \
	&& ln -sf ../../lib/$$(readlink /usr/lib/libncursesw.so) /usr/lib/libncursesw.so \
	&& for lib in ncurses form panel menu ; do \
		rm -f /usr/lib/lib$${lib}.so ; \
		echo "INPUT(-l$${lib}w)" > /usr/lib/lib$${lib}.so ; \
		ln -sf $${lib}w.pc /usr/lib/pkgconfig/$${lib}.pc ; \
	done \
	&& rm -f /usr/lib/libcursesw.so \
	&& echo "INPUT(-lncursesw)" > /usr/lib/libcursesw.so \
	&& ln -sf libncurses.so /usr/lib/libcurses.so

.PHONY: default build test install
