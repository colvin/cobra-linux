# $FENRIR$
#
# Copyright © 2019, Colvin Wellborn All rights reserved.

PACKAGE		= shadow
ARCHIVE		= shadow-4.6.tar.xz
URL		= https://github.com/shadow-maint/shadow/releases/download/4.6
CHECKSUM	= b491fecbf1232632c32ff8f1437fd60e
SOURCE_DIR	= shadow-4.6

default: build install postinstall clean

include $(CURDIR)/../../mk/pkg.mk

build: chroot-check fetch extract
	cd $(BUILD_DIR) \
	&& sed -i 's/groups$(EXEEXT) //' src/Makefile.in \
	&& find man -name Makefile.in -exec sed -i 's/groups\.1 / /'   {} \; \
	&& find man -name Makefile.in -exec sed -i 's/getspnam\.3 / /' {} \; \
	&& find man -name Makefile.in -exec sed -i 's/passwd\.5 / /'   {} \; \
	&& sed -i -e 's@#ENCRYPT_METHOD DES@ENCRYPT_METHOD SHA512@' \
		-e 's@/var/spool/mail@/var/mail@' etc/login.defs \
	&& ./configure \
		--sysconfdir=/etc \
		--with-group-name-max-length=32 \
	&& make -j$(PKG_JOBS)

test:
	true

install:
	cd $(BUILD_DIR) && make install
	mv /usr/bin/passwd /bin

postinstall:
	pwconv
	grpconv
	sed -i 's/yes/no/' /etc/default/useradd

.PHONY: default build test install
