# $FENRIR: mk/extract.mk 8b800ad0c3c6da18caa0053206ed595631f65d1d 2019-01-05T19:35:21-05:00 colvin $
#
# Copyright (c) 2019, Colvin Wellborn All rights reserved.

extract: $(DISTFILES)/$(ARCHIVE) $(WORK_DIR)/$(SOURCE_DIR)

$(WORK_DIR)/$(SOURCE_DIR): $(WORK_DIR)
	tar xf $(DISTFILES)/$(ARCHIVE) -C $(WORK_DIR)
