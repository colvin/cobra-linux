# $CCL$
#
# Copyright (c) 2019, Colvin Wellborn All rights reserved.

clean:
	test -n "$(WORK_DIR)" && test "$(WORK_DIR)" != "/"
	-rm -rf "$(WORK_DIR)"
