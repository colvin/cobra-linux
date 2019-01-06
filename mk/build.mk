# $FENRIR$
#
# Copyright © 2019, Colvin Wellborn All rights reserved.

build-image:
	@test -z "$(FENRIR_CONTAINER)" || ( \
		echo "** container cannot be built within a container **"; \
		exit 1 \
	)
	git archive -o $(SRC_ARCHIVE) HEAD
	docker build -f builder/Dockerfile -t fenrir/builder:latest $(PROJECT_ROOT)

ifdef FENRIR_CONTAINER
TOP_BUILD_TARGET = run-build
export PATH = /tools/bin:/usr/sbin:/usr/bin:/sbin:/bin
export FORCE_UNSAFE_CONFIGURE = 1
else
TOP_BUILD_TARGET = run-container
endif

BUILD_TARGETS = \
	container-check \
	bootstrap \
	build-prep \
	build-system \
	build-cleanup \
	system-archive

build: $(TOP_BUILD_TARGET)

BOOTSTRAP_ARCHIVE	= fenrir-bootstrap.tgz
SYSTEM_ARCHIVE		= fenrir.tgz

BOOTSTRAP_ONE = \
	binutils \
	gcc \
	linux \
	glibc \
	libstdcxx

BOOTSTRAP_TWO = \
	binutils \
	gcc \
	tcl \
	expect \
	dejagnu \
	m4 \
	ncurses \
	bash \
	bison \
	bzip2 \
	coreutils \
	diffutils \
	file \
	findutils \
	gawk \
	gettext \
	grep \
	gzip \
	make \
	patch \
	perl \
	sed \
	tar \
	texinfo \
	util-linux \
	xz

ifndef KEEP_BUILD_CONTAINER
DOCKER_RUN_RM	= --rm
endif

run-container: build-image $(LOCAL_DISTFILES) $(LOCAL_RESULT_DIR)
	time --format '\n%C\n(%x) runtime: %E, mem: %M KB\n' \
	docker run -t $(DOCKER_RUN_RM) \
		--cap-add=SYS_ADMIN \
		--mount 'type=bind,src=$(LOCAL_DISTFILES),dst=$(DISTFILES)' \
		--mount 'type=bind,src=$(LOCAL_RESULT_DIR),dst=$(RESULT_DIR)' \
		fenrir/builder:latest

run-build: $(BUILD_TARGETS)

bootstrap: $(RESULT_DIR)/$(BOOTSTRAP_ARCHIVE)
	test -d $(BUILD_ROOT)/tools/bin \
	|| tar xf $(RESULT_DIR)/$(BOOTSTRAP_ARCHIVE) -C $(BUILD_ROOT)

$(RESULT_DIR)/$(BOOTSTRAP_ARCHIVE):
	@echo
	@echo "    +===========================+"
	@echo "    |                           |"
	@echo "    |    bootstrap phase one    |"
	@echo "    |                           |"
	@echo "    +===========================+"
	@echo
	for pkg in $(BOOTSTRAP_ONE); do \
		echo  ; echo "====> $$pkg"; echo ; \
		$(MAKE) -C $(PKG_DIR)/$$pkg bootstrap-one clean || exit 1 ;\
	done
	@echo
	@echo "    +===========================+"
	@echo "    |                           |"
	@echo "    |    bootstrap phase two    |"
	@echo "    |                           |"
	@echo "    +===========================+"
	@echo
	for pkg in $(BOOTSTRAP_TWO); do \
		echo  ; echo "====> $$pkg"; echo ; \
		$(MAKE) -C $(PKG_DIR)/$$pkg bootstrap-two clean || exit 1; \
	done
	-strip --strip-debug /tools/lib/*
	-/usr/bin/strip --strip-unneeded /tools/{,s}bin/*
	-rm -rf /tools/{,share}/{info,man,doc}
	-find /tools/{lib,libexec} -name \*.la -delete
	cd $(BUILD_ROOT) \
	&& tar czf $(RESULT_DIR)/$(BOOTSTRAP_ARCHIVE) tools

build-prep:
	@echo
	@echo "    +==================+"
	@echo "    |                  |"
	@echo "    |    build prep    |"
	@echo "    |                  |"
	@echo "    +==================+"
	@echo
	mkdir -p $(BUILD_ROOT)/{dev,proc,sys,run}
	mount --bind /dev $(BUILD_ROOT)/dev
	mount -t proc proc $(BUILD_ROOT)/proc
	mount -t sysfs sysfs $(BUILD_ROOT)/sys
	mount -t tmpfs tmpfs $(BUILD_ROOT)/run
	mkdir -p $(BUILD_ROOT)/fenrir
	mount --bind `pwd` $(BUILD_ROOT)/fenrir
	## core directory tree
	mkdir -p $(BUILD_ROOT)/bin
	mkdir -p $(BUILD_ROOT)/boot
	mkdir -p $(BUILD_ROOT)/etc
	mkdir -p $(BUILD_ROOT)/etc/{opt,sysconfig}
	mkdir -p $(BUILD_ROOT)/home
	mkdir -p $(BUILD_ROOT)/lib
	mkdir -p $(BUILD_ROOT)/lib/firmware
	mkdir -p $(BUILD_ROOT)/media
	mkdir -p $(BUILD_ROOT)/media/{floppy,cdrom}
	mkdir -p $(BUILD_ROOT)/mnt
	mkdir -p $(BUILD_ROOT)/opt
	mkdir -p $(BUILD_ROOT)/sbin
	mkdir -p $(BUILD_ROOT)/srv
	mkdir -p $(BUILD_ROOT)/var
	install -d -m 0750 $(BUILD_ROOT)/root
	install -d -m 1777 $(BUILD_ROOT)/tmp $(BUILD_ROOT)/var/tmp
	mkdir -p $(BUILD_ROOT)/usr/{,local/}{bin,include,lib,sbin,src}
	mkdir -p $(BUILD_ROOT)/usr/{,local/}share/{color,dict,doc,info,locale,man}
	mkdir $(BUILD_ROOT)/usr/{,local/}share/{misc,terminfo,zoneinfo}
	mkdir $(BUILD_ROOT)/usr/libexec
	mkdir -p $(BUILD_ROOT)/usr/{,local/}share/man/man{1..8}
	mkdir $(BUILD_ROOT)/lib64
	mkdir $(BUILD_ROOT)/var/{log,mail,spool}
	ln -s /run $(BUILD_ROOT)/var/run
	ln -s /run/lock $(BUILD_ROOT)/var/lock
	mkdir -p $(BUILD_ROOT)/var/{opt,cache,lib/{color,misc,locate},local}
	## symlinks
	ln -s /tools/bin/{bash,cat,dd,echo,ln,pwd,rm,stty} $(BUILD_ROOT)/bin
	ln -s /tools/bin/{env,install,perl} $(BUILD_ROOT)/usr/bin
	ln -s /tools/lib/libgcc_s.so{,.1} $(BUILD_ROOT)/usr/lib
	ln -s /tools/lib/libstdc++.{a,so{,.6}} $(BUILD_ROOT)/usr/lib
	for lib in blkid lzma mount uuid; do \
	    ln -s /tools/lib/lib$$lib.so* $(BUILD_ROOT)/usr/lib; \
	done
	ln -sf /tools/include/blkid    $(BUILD_ROOT)/usr/include
	ln -sf /tools/include/libmount $(BUILD_ROOT)/usr/include
	ln -sf /tools/include/uuid     $(BUILD_ROOT)/usr/include
	install -dm755 $(BUILD_ROOT)/usr/lib/pkgconfig
	for pc in blkid mount uuid; do \
	    sed 's@tools@usr@g' /tools/lib/pkgconfig/$${pc}.pc \
		> $(BUILD_ROOT)/usr/lib/pkgconfig/$${pc}.pc; \
	done
	ln -sv bash $(BUILD_ROOT)/bin/sh

build-system:
	@echo
	@echo "    +=======================+"
	@echo "    |                       |"
	@echo "    |    building system    |"
	@echo "    |                       |"
	@echo "    +=======================+"
	@echo
	chroot $(BUILD_ROOT) /tools/bin/env -i \
		HOME=/root \
		TERM=$(TERM) \
		PATH=/bin:/usr/bin:/sbin:/usr/sbin:/tools/bin \
		/tools/bin/bash +h -c \
		'make -C /fenrir chroot-build-one'

chroot-build-one:
	@echo
	@echo "    +==================a=================+"
	@echo "    |                                    |"
	@echo "    |    building stage one in chroot    |"
	@echo "    |                                    |"
	@echo "    +==================a=================+"
	@echo
	test -n "$(FENRIR_IN_CHROOT)" || do ( \
		echo "** cannot do build-system outside of the chroot **"; \
		exit 1 \
	)

build-cleanup:
	@echo
	@echo "    +=====================+"
	@echo "    |                     |"
	@echo "    |    build cleanup    |"
	@echo "    |                     |"
	@echo "    +=====================+"
	@echo
	rm -rf $(BUILD_ROOT)/tools
	umount $(BUILD_ROOT)/dev
	umount $(BUILD_ROOT)/proc
	umount $(BUILD_ROOT)/sys
	umount $(BUILD_ROOT)/run

system-archive:
	@echo
	@echo "    +======================+"
	@echo "    |                      |"
	@echo "    |    system archive    |"
	@echo "    |                      |"
	@echo "    +======================+"
	@echo
	cd $(BUILD_ROOT) && tar czf $(RESULT_DIR)/$(SYSTEM_ARCHIVE) *

.PHONY: build run-container run-build $(BUILD_TARGETS)