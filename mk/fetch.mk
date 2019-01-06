# $COBRA$
#
# Copyright (c) 2019, Colvin Wellborn All rights reserved.

fetch: $(DISTFILES) $(DISTFILES)/$(ARCHIVE) checksum

$(DISTFILES)/$(ARCHIVE):
	cd $(DISTFILES) && curl -L -O $(URL)/$(ARCHIVE)

checksum:
	test "$(CHECKSUM)" = "` md5sum $(DISTFILES)/$(ARCHIVE) | cut -d' ' -f1`"

.PHONY: fetch
