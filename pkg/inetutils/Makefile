# $FENRIR$
#
# Copyright © 2019, Colvin Wellborn All rights reserved.

PACKAGE		= inetutils
ARCHIVE		= inetutils-1.9.4.tar.xz
URL		= http://ftp.gnu.org/gnu/inetutils
CHECKSUM	= 87fef1fa3f603aef11c41dcc097af75e
SOURCE_DIR	= inetutils-1.9.4

default: build install clean

include $(CURDIR)/../../mk/pkg.mk

build: chroot-check fetch extract
	cd $(BUILD_DIR) \
	&& ./configure \
		--prefix=/usr \
		--localstatedir=/var \
		--disable-logger \
		--disable-whois \
		--disable-rcp \
		--disable-rexec \
		--disable-rlogin \
		--disable-rsh \
		--disable-servers \
	&& make -j$(PKG_JOBS)

test:
	cd $(BUILD_DIR) && make check

install:
	cd $(BUILD_DIR) && make install
	mv /usr/bin/{hostname,ping,ping6,traceroute} /bin
	mv /usr/bin/ifconfig /sbin

.PHONY: default build test install
