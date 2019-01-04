# $CCL$
#
# Copyright (c) 2019, Colvin Wellborn All rights reserved.

DISTFILES	= $(PROJECT_ROOT)/distfiles
WORKDIR		= $(CURDIR)/work

$(DISTFILES):
	mkdir -p $(DISTFILES)

$(WORKDIR):
	mkdir -p $(WORKDIR)
