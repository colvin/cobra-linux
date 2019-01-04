# $CCL$
#
# Copyright (c) 2019, Colvin Wellborn All rights reserved.


rcs-tags:
	git stash save
	rm .git/index
	git checkout HEAD -- `git rev-parse --show-toplevel`
	git stash pop || true
