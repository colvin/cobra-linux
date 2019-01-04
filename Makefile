# $CCL$
#
# Copyright (c) 2019, Colvin Wellborn All rights reserved.

default: build

PROJECT_ROOT	= $(CURDIR)

include mk/init.mk
include mk/dirs.mk
include mk/util.mk


distclean:
	test -n "$(DISTFILES)" && test "$(DISTFILES)" != "/"
	-rm -rf "$(DISTFILES)"
