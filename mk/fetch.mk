# $FENRIR: mk/fetch.mk 8b800ad0c3c6da18caa0053206ed595631f65d1d 2019-01-05T19:35:21-05:00 colvin $
#
# Copyright (c) 2019, Colvin Wellborn All rights reserved.

fetch: $(DISTFILES) $(DISTFILES)/$(ARCHIVE) checksum

$(DISTFILES)/$(ARCHIVE):
	cd $(DISTFILES) && curl -L -O $(URL)/$(ARCHIVE)

checksum:
	test "$(CHECKSUM)" = "` md5sum $(DISTFILES)/$(ARCHIVE) | cut -d' ' -f1`"

.PHONY: fetch
