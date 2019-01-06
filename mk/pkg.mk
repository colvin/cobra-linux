# $FENRIR: mk/pkg.mk 8b800ad0c3c6da18caa0053206ed595631f65d1d 2019-01-05T19:35:21-05:00 colvin $
#
# Copyright (c) 2019, Colvin Wellborn All rights reserved.

PROJECT_ROOT	?= $(CURDIR)/../..

include $(PROJECT_ROOT)/mk/dirs.mk
include $(PROJECT_ROOT)/mk/fetch.mk
include $(PROJECT_ROOT)/mk/extract.mk
include $(PROJECT_ROOT)/mk/clean.mk

BOOTSTRAP_TGT	= x86_64-fenrir-linux-gnu
