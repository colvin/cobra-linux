# $FENRIR: Makefile 8b800ad0c3c6da18caa0053206ed595631f65d1d 2019-01-05T19:35:21-05:00 colvin $
#
# Copyright (c) 2019, Colvin Wellborn All rights reserved.

default: build

PROJECT_ROOT	= $(CURDIR)

include mk/init.mk
include mk/dirs.mk
include mk/util.mk
include mk/build.mk
include mk/setup.mk
