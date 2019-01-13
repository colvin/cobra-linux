# $FENRIR$
#
# Copyright © 2019, Colvin Wellborn All rights reserved.

PACKAGE		= gcc
ARCHIVE		= gcc-8.2.0.tar.xz
URL		= http://ftp.gnu.org/gnu/gcc/gcc-8.2.0
CHECKSUM	= 4ab282f414676496483b3e1793d07862
SOURCE_DIR	= gcc-8.2.0

default: build install postinstall test-compile clean

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

BOOTSTRAP_TWO_TARGETS = \
	fetch \
	extract \
	bootstrap-prep \
	bootstrap-two-build \
	install \
	bootstrap-two-postinstall \
	bootstrap-two-test-compile

bootstrap-two: $(BOOTSTRAP_TWO_TARGETS)

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

bootstrap-two-postinstall:
	ln -sf /tools/bin/gcc /tools/bin/cc

bootstrap-two-test-compile:
	cd $(WORK_DIR) \
	&& echo 'int main(){}' > dummy.c \
	&& cc dummy.c \
	&& readelf -l a.out | grep ': /tools' | grep -q /tools/lib64/ld-linux-x86-64.so.2

build: chroot-check fetch extract
	rm -f /usr/lib/gcc
	cd $(BUILD_DIR) \
	&& sed -e '/m64=/s/lib64/lib/' -i.orig gcc/config/i386/t-linux64
	mkdir $(BUILD_DIR)/build
	cd $(BUILD_DIR)/build \
	&& SED=sed ../configure \
		--prefix=/usr \
		--enable-languages=c,c++ \
		--disable-multilib \
		--disable-bootstrap \
		--disable-libmpx \
		--with-system-zlib \
	&& make -j$(PKG_JOBS)

test:
	cd $(BUILD_DIR)/build \
	&& ulimit -s 32768 \
	&& rm ../gcc/testsuite/g++.dg/pr83239.C \
	&& chown -Rv nobody . \
	&& su nobody -s /bin/bash -c "PATH=$PATH make -k check" \
	&& ../contrib/test_summary | grep -A7 Summ

install:
	cd $(BUILD_DIR)/build && make install

postinstall:
	ln -sf ../usr/bin/cpp /lib
	ln -sf /usr/bin/gcc /usr/bin/cc
	install -dm755 /usr/lib/bfd-plugins
	ln -sf ../../libexec/gcc/$$(gcc -dumpmachine)/8.2.0/liblto_plugin.so \
		/usr/lib/bfd-plugins/
	mkdir -p /usr/share/gdb/auto-load/usr/lib
	mv /usr/lib/*gdb.py /usr/share/gdb/auto-load/usr/lib

test-compile:
	echo 'int main(){}' > /tmp/dummy.c
	cc /tmp/dummy.c -v -Wl,--verbose -o /tmp/dummy &> /tmp/dummy.log
	readelf -l /tmp/dummy | grep -q ': /lib64/ld-linux-x86-64.so.2'
	test `grep -o '/usr/lib.*/crt[1in].*succeeded' /tmp/dummy.log | wc -l` = '3'
	test `grep -A1 '#include <...>' /tmp/dummy.log | tail -1 | awk '{print $$1}'` = "/usr/lib/gcc/x86_64-pc-linux-gnu/8.2.0/include"
	test `grep -A2 '#include <...>' /tmp/dummy.log | tail -1 | awk '{print $$1}'` = "/usr/local/include"
	test `grep -A3 '#include <...>' /tmp/dummy.log | tail -1 | awk '{print $$1}'` = "/usr/lib/gcc/x86_64-pc-linux-gnu/8.2.0/include-fixed"
	test `grep -A4 '#include <...>' /tmp/dummy.log | tail -1 | awk '{print $$1}'` = "/usr/include"
	grep -q 'SEARCH_DIR("/usr/x86_64-pc-linux-gnu/lib64")' /tmp/dummy.log
	grep -q 'SEARCH_DIR("/usr/local/lib64")' /tmp/dummy.log
	grep -q 'SEARCH_DIR("/lib64")' /tmp/dummy.log
	grep -q 'SEARCH_DIR("/usr/lib64")' /tmp/dummy.log
	grep -q 'SEARCH_DIR("/usr/x86_64-pc-linux-gnu/lib")' /tmp/dummy.log
	grep -q 'SEARCH_DIR("/usr/local/lib")' /tmp/dummy.log
	grep -q 'SEARCH_DIR("/lib")' /tmp/dummy.log
	grep -q 'SEARCH_DIR("/usr/lib")' /tmp/dummy.log
	grep -q 'open /lib/libc.so.6 succeeded' /tmp/dummy.log
	grep -q 'found ld-linux-x86-64.so.2 at /lib/ld-linux-x86-64.so.2' /tmp/dummy.log
	rm /tmp/dummy*

.PHONY: default build test install
