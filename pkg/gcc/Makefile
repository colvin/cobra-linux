# $FENRIR$
#
# Copyright © 2019, Colvin Wellborn All rights reserved.

PACKAGE		= gcc
ARCHIVE		= gcc-8.2.0.tar.xz
URL		= http://ftp.gnu.org/gnu/gcc/gcc-8.2.0
CHECKSUM	= 4ab282f414676496483b3e1793d07862
SOURCE_DIR	= gcc-8.2.0

default: build install clean

include $(CURDIR)/../../mk/pkg.mk

bootstrap-one: fetch extract bootstrap-prep bootstrap-one-build install

bootstrap-prep:
	$(MAKE) -C $(PKG_DIR)/mpfr extract WORK_DIR=$(WORK_DIR)
	mv $(WORK_DIR)/mpfr* $(BUILD_DIR)/mpfr
	$(MAKE) -C $(PKG_DIR)/gmp extract WORK_DIR=$(WORK_DIR)
	mv $(WORK_DIR)/gmp* $(BUILD_DIR)/gmp
	$(MAKE) -C $(PKG_DIR)/mpc extract WORK_DIR=$(WORK_DIR)
	mv $(WORK_DIR)/mpc* $(BUILD_DIR)/mpc
	cd $(BUILD_DIR) \
	&& for file in gcc/config/{linux,i386/linux{,64}}.h; do \
		echo "----> $$file"; \
		cp -u $$file{,.orig}; \
		sed -e 's@/lib\(64\)\?\(32\)\?/ld@/tools&@g' \
		    -e 's@/usr@/tools@g' $$file.orig > $$file; \
		echo '#undef STANDARD_STARTFILE_PREFIX_1' >> $$file; \
		echo '#undef STANDARD_STARTFILE_PREFIX_2' >> $$file; \
		echo '#define STANDARD_STARTFILE_PREFIX_1 "/tools/lib/"' >> $$file; \
		echo '#define STANDARD_STARTFILE_PREFIX_2 ""' >> $$file; \
		touch $$file.orig; \
	done \
	&& sed -e '/m64=/s/lib64/lib/' -i.orig gcc/config/i386/t-linux64

bootstrap-one-build:
	mkdir $(BUILD_DIR)/build
	cd $(BUILD_DIR)/build \
	&& ../configure \
		--target=$(BOOTSTRAP_TGT) \
		--prefix=/tools \
		--with-glibc-version=2.11 \
		--with-sysroot=$(BUILD_ROOT) \
		--with-newlib \
		--without-headers \
		--with-local-prefix=/tools \
		--with-native-system-header-dir=/tools/include \
		--disable-nls \
		--disable-shared \
		--disable-multilib \
		--disable-decimal-float \
		--disable-threads \
		--disable-libatomic \
		--disable-libgomp \
		--disable-libmpx \
		--disable-libquadmath \
		--disable-libssp \
		--disable-libvtv \
		--disable-libstdcxx \
		--enable-languages=c,c++ \
	&& make -j$(PKG_JOBS)

bootstrap-two: fetch extract bootstrap-prep bootstrap-two-build install compile-dummy

bootstrap-two-build:
	cd $(BUILD_DIR) \
	&& cat gcc/limitx.h gcc/glimits.h gcc/limity.h > \
		$$( dirname $$( $(BOOTSTRAP_TGT)-gcc -print-libgcc-file-name ))/include-fixed/limits.h
	mkdir $(BUILD_DIR)/build
	cd $(BUILD_DIR)/build \
	&& CC=$(BOOTSTRAP_TGT)-gcc \
	CXX=$(BOOTSTRAP_TGT)-g++ \
	AR=$(BOOTSTRAP_TGT)-ar \
	RANLIB=$(BOOTSTRAP_TGT)-ranlib \
	../configure \
		--prefix=/tools \
		--with-local-prefix=/tools \
		--with-native-system-header-dir=/tools/include \
		--enable-languages=c,c++ \
		--disable-libstdcxx-pch \
		--disable-multilib \
		--disable-bootstrap \
		--disable-libgomp \
	&& make -j$(PKG_JOBS)

build: chroot-check fetch extract
	false

test:
	false

install:
	cd $(BUILD_DIR)/build && make install
	ln -sf /tools/bin/gcc /tools/bin/cc

compile-dummy:
	cd $(WORK_DIR) \
	&& echo 'int main(){}' > dummy.c \
	&& cc dummy.c \
	&& readelf -l a.out | grep ': /tools' | grep -q /tools/lib64/ld-linux-x86-64.so.2

.PHONY: default build test install
