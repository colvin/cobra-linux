# $CCL$
#
# Copyright (c) 2019, Colvin Wellborn All rights reserved.

fetch: $(DISTFILES)/$(ARCHIVE)

$(DISTFILES)/$(ARCHIVE): $(DISTFILES)
	cd $(DISTFILES) && curl -L -O $(URL)/$(ARCHIVE)
	test "$(CHECKSUM)" = "` md5sum $(DISTFILES)/$(ARCHIVE) | cut -d' ' -f1`"
