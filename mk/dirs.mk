# $FENRIR: mk/dirs.mk 8b800ad0c3c6da18caa0053206ed595631f65d1d 2019-01-05T19:35:21-05:00 colvin $
#
# Copyright (c) 2019, Colvin Wellborn All rights reserved.

SETUP_DIR		= $(PROJECT_ROOT)/setup
PKG_DIR			= $(PROJECT_ROOT)/pkg
BUILD_ROOT		= /build
DISTFILES		= /distfiles
LOCAL_DISTFILES		= $(PROJECT_ROOT)/distfiles
RESULT_DIR		= /result
LOCAL_RESULT_DIR	= $(PROJECT_ROOT)/result

WORK_DIR	?= $(CURDIR)/work
BUILD_DIR	= $(WORK_DIR)/$(SOURCE_DIR)

$(DISTFILES):
	mkdir -p $(DISTFILES)

$(LOCAL_DISTFILES):
	mkdir -p $(LOCAL_DISTFILES)

$(WORK_DIR):
	mkdir -p $(WORK_DIR)

$(BUILD_ROOT):
	mkdir -p $(BUILD_ROOT)

$(RESULT_DIR):
	mkdir -p $(RESULT_DIR)

$(LOCAL_RESULT_DIR):
	mkdir -p $(LOCAL_RESULT_DIR)
