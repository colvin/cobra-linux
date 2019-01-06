# $FENRIR$
#
# Copyright (c) 2019, Colvin Wellborn All rights reserved.

SRC_ARCHIVE	= fenrir-src.tgz

distclean:
	test -n "$(LOCAL_DISTFILES)" && test "$(LOCAL_DISTFILES)" != "/"
	-rm -rf "$(LOCAL_DISTFILES)"
	test -n "$(LOCAL_RESULT_DIR)" && test "$(LOCAL_RESULT_DIR)" != "/"
	-rm -rf "$(LOCAL_RESULT_DIR)"
	-rm -rf "$(PROJECT_ROOT)"/$(SRC_ARCHIVE)

container-check:
	@test -n "$(FENRIR_CONTAINER)" || ( \
		echo "** build is unsafe outside of the build container **"; \
		exit 1 \
	)

rcs-tags:
	git stash save
	rm .git/index
	git checkout HEAD -- `git rev-parse --show-toplevel`
	git stash pop || true
