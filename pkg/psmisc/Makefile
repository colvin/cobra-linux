# $FENRIR$
#
# Copyright © 2019, Colvin Wellborn All rights reserved.

PACKAGE		= psmisc
ARCHIVE		= psmisc-23.1.tar.xz
URL		= https://sourceforge.net/projects/psmisc/files/psmisc
CHECKSUM	= bbba1f701c02fb50d59540d1ff90d8d1
SOURCE_DIR	= psmisc-23.1

default: build install clean

include $(CURDIR)/../../mk/pkg.mk

build: chroot-check fetch extract
	cd $(BUILD_DIR) \
	&& ./configure --prefix=/usr \
	&& make -j$(PKG_JOBS)

test:

install:
	cd $(BUILD_DIR) && make install
	mv /usr/bin/fuser /bin
	mv /usr/bin/killall /bin

.PHONY: default build test install
