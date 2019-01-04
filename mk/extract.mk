# $CCL$
#
# Copyright (c) 2019, Colvin Wellborn All rights reserved.

extract: $(WORKDIR) $(DISTFILES)/$(ARCHIVE)
	tar xvf $(DISTFILES)/$(ARCHIVE) -C $(WORKDIR)
