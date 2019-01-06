# $COBRA$
#
# Copyright (c) 2019, Colvin Wellborn All rights reserved.

extract: $(DISTFILES)/$(ARCHIVE) $(WORK_DIR)/$(SOURCE_DIR)

$(WORK_DIR)/$(SOURCE_DIR): $(WORK_DIR)
	tar xf $(DISTFILES)/$(ARCHIVE) -C $(WORK_DIR)
