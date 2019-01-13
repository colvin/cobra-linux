# $FENRIR$
#
# Copyright © 2019, Colvin Wellborn All rights reserved.

PACKAGE		= bash
ARCHIVE		= bash-4.4.18.tar.gz
URL		= http://ftp.gnu.org/gnu/bash
CHECKSUM	= 518e2c187cc11a17040f0915dddce54e
SOURCE_DIR	= bash-4.4.18

default: build install postinstall clean

include $(CURDIR)/../../mk/pkg.mk

bootstrap-two: fetch extract bootstrap-two-build install bootstrap-two-postinstall

bootstrap-two-build:
	cd $(BUILD_DIR) \
	&& ./configure --prefix=/tools --without-bash-malloc \
	&& make -j$(PKG_JOBS)

bootstrap-two-postinstall:
	ln -s bash /tools/bin/sh

build: chroot-check fetch extract
	cd $(BUILD_DIR) \
	&& ./configure \
		--prefix=/usr \
		--docdir=/usr/share/doc/bash-4.4.18 \
		--without-bash-malloc \
		--with-installed-readline \
	&& make -j$(PKG_JOBS)

test:
	cd $(BUILD_DIR) \
	&& chown -R nobody . \
	&& su nobody -s /bin/bash -c "PATH=$$PATH make tests"

install:
	cd $(BUILD_DIR) && make install

postinstall:
	mv -f /usr/bin/bash /bin

.PHONY: default build test install
