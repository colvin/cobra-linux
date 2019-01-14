# $FENRIR$
#
# Copyright © 2019, Colvin Wellborn All rights reserved.

PACKAGE		= perl-XML-Parser
ARCHIVE		= XML-Parser-2.44.tar.gz
URL		= https://cpan.metacpan.org/authors/id/T/TO/TODDR
CHECKSUM	= af4813fe3952362451201ced6fbce379
SOURCE_DIR	= XML-Parser-2.44

default: build install clean

include $(CURDIR)/../../mk/pkg.mk

build: chroot-check fetch extract
	cd $(BUILD_DIR) \
	&& perl Makefile.PL \
	&& make -j$(PKG_JOBS)

test:
	cd $(BUILD_DIR) && make test

install:
	cd $(BUILD_DIR) && make install

.PHONY: default build test install
