# $FENRIR$
#
# Copyright © 2019, Colvin Wellborn All rights reserved.

PROJECT_ROOT	?= $(CURDIR)/../..

include $(PROJECT_ROOT)/mk/dirs.mk
include $(PROJECT_ROOT)/mk/fetch.mk
include $(PROJECT_ROOT)/mk/extract.mk
include $(PROJECT_ROOT)/mk/clean.mk
include $(PROJECT_ROOT)/mk/util.mk

BOOTSTRAP_TGT	= x86_64-fenrir-linux-gnu

PKG_JOBS	?= $(shell expr `grep ^processor /proc/cpuinfo | wc -l` + 2)
