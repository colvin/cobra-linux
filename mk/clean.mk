# $CCL$
#
# Copyright (c) 2019, Colvin Wellborn All rights reserved.

clean:
	test -n "$(WORKDIR)" && test "$(WORKDIR)" != "/"
	-rm -rf "$(WORKDIR)"
