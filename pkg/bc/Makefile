# $FENRIR$
#
# Copyright © 2019, Colvin Wellborn All rights reserved.

PACKAGE		= bc
ARCHIVE		= bc-1.07.1.tar.gz
URL		= http://ftp.gnu.org/gnu/bc
CHECKSUM	= cda93857418655ea43590736fc3ca9fc
SOURCE_DIR	= bc-1.07.1

default: build install clean

include $(CURDIR)/../../mk/pkg.mk

build: chroot-check fetch extract
	cp fix-libmath_h $(BUILD_DIR)/bc/
	ln -sv /tools/lib/libncursesw.so.6 /usr/lib/libncursesw.so.6
	ln -sfv libncurses.so.6 /usr/lib/libncurses.so
	cd $(BUILD_DIR) \
	&& sed -i -e '/flex/s/as_fn_error/: ;; # &/' configure \
	&& ./configure \
		--prefix=/usr \
		--with-readline \
		--mandir=/usr/share/man \
		--infodir=/usr/share/info \
	&& make -j$(PKG_JOBS)

test:
	cd $(BUILD_DIR) && echo "quit" | ./bc/bc -l Test/checklib.b

install:
	cd $(BUILD_DIR) && make install

.PHONY: default build test install
