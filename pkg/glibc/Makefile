# $FENRIR$
#
# Copyright © 2019, Colvin Wellborn All rights reserved.

PACKAGE		= glibc
ARCHIVE		= glibc-2.28.tar.xz
URL		= http://ftp.gnu.org/gnu/glibc
CHECKSUM	= c81d2388896379997bc359d4f2084239
SOURCE_DIR	= glibc-2.28

default: build test install clean

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
	cd $(BUILD_DIR) \
	&& patch -Np1 -i $(CURDIR)/glibc-2.28-fhs-1.patch \
	&& ln -sf /tools/lib/gcc /usr/lib/gcc \
	&& ln -sf ../lib/ld-linux-x86-64.so.2 /lib64 \
	&& ln -sf ../lib/ld-linux-x86-64.so.2 /lib64/ld-lsb-x86-64.so.3 \
	&& rm -f /usr/include/limits.h
	mkdir $(BUILD_DIR)/build
	cd $(BUILD_DIR)/build \
	&& CC="gcc -isystem /usr/lib/gcc/x86_64-pc-linux-gnu/8.2.0/include -isystem /usr/include" \
	../configure \
		--prefix=/usr \
		--disable-werror \
		--enable-kernel=3.2 \
		--enable-stack-protector=strong \
		libc_cv_slibdir=/lib \
	&& make -j$(PKG_JOBS)

test:
	-cd $(BUILD_DIR)/build && make -j$(PKG_JOBS) check

install:
	touch /etc/ld.so.conf
	cd $(BUILD_DIR)/build \
	&& sed '/test-installation/s@$(PERL)@echo not running@' -i ../Makefile \
	&& make install \
	&& cp ../nscd/nscd.conf /etc/nscd.conf \
	&& mkdir -p /var/cache/nscd \
	&& mkdir -pv /usr/lib/locale \
	&& localedef -i cs_CZ -f UTF-8 cs_CZ.UTF-8 \
	&& localedef -i de_DE -f ISO-8859-1 de_DE \
	&& localedef -i de_DE@euro -f ISO-8859-15 de_DE@euro \
	&& localedef -i de_DE -f UTF-8 de_DE.UTF-8 \
	&& localedef -i en_GB -f UTF-8 en_GB.UTF-8 \
	&& localedef -i en_HK -f ISO-8859-1 en_HK \
	&& localedef -i en_PH -f ISO-8859-1 en_PH \
	&& localedef -i en_US -f ISO-8859-1 en_US \
	&& localedef -i en_US -f UTF-8 en_US.UTF-8 \
	&& localedef -i es_MX -f ISO-8859-1 es_MX \
	&& localedef -i fa_IR -f UTF-8 fa_IR \
	&& localedef -i fr_FR -f ISO-8859-1 fr_FR \
	&& localedef -i fr_FR@euro -f ISO-8859-15 fr_FR@euro \
	&& localedef -i fr_FR -f UTF-8 fr_FR.UTF-8 \
	&& localedef -i it_IT -f ISO-8859-1 it_IT \
	&& localedef -i it_IT -f UTF-8 it_IT.UTF-8 \
	&& localedef -i ja_JP -f EUC-JP ja_JP \
	&& localedef -i ru_RU -f KOI8-R ru_RU.KOI8-R \
	&& localedef -i ru_RU -f UTF-8 ru_RU.UTF-8 \
	&& localedef -i tr_TR -f UTF-8 tr_TR.UTF-8 \
	&& localedef -i zh_CN -f GB18030 zh_CN.GB18030

.PHONY: default build test install
