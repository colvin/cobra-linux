# $FENRIR: mk/build.mk 8b800ad0c3c6da18caa0053206ed595631f65d1d 2019-01-05T19:35:21-05:00 colvin $
#
# Copyright (c) 2019, Colvin Wellborn All rights reserved.

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
	bootstrap

build: $(TOP_BUILD_TARGET)

BOOTSTRAP_ARCHIVE = fenrir-bootstrap.tgz

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
	docker run -t $(DOCKER_RUN_RM) \
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

.PHONY: build run-container run-build bootstrap
