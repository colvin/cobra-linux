# $FENRIR$
#
# Copyright © 2019, Colvin Wellborn All rights reserved.

PACKAGE		= glibc
ARCHIVE		= glibc-2.28.tar.xz
URL		= http://ftp.gnu.org/gnu/glibc
CHECKSUM	= c81d2388896379997bc359d4f2084239
SOURCE_DIR	= glibc-2.28

default: build install clean

include $(CURDIR)/../../mk/pkg.mk

bootstrap-one: fetch extract bootstrap-one-build install bootstrap-one-test

bootstrap-one-build:
	mkdir $(BUILD_DIR)/build
	cd $(BUILD_DIR)/build \
	&& ../configure \
		--prefix=/tools \
		--host=$(BOOTSTRAP_TGT) \
		--build=`../scripts/config.guess` \
		--enable-kernel=3.2 \
		--with-headers=/tools/include \
		libc_cv_forced_unwind=yes \
		libc_cv_c_cleanup=yes \
	&& make -j$(PKG_JOBS)

bootstrap-one-test:
	cd $(WORK_DIR) \
	&& echo 'int main(){}' > dummy.c \
	&& $(BOOTSTRAP_TGT)-gcc dummy.c \
	&& readelf -l a.out | grep ': /tools' | grep -q /tools/lib64/ld-linux-x86-64.so.2

build: chroot-check fetch extract
	false

test:
	false

install:
	cd $(BUILD_DIR)/build && make install

.PHONY: default build test install
