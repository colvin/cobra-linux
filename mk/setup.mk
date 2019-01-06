# $FENRIR$
#
# Copyright © 2019, Colvin Wellborn All rights reserved.

setup: $(BUILD_ROOT)
	mkdir -p $(BUILD_ROOT)/tools
	ln -s $(BUILD_ROOT)/tools /
	install $(SETUP_DIR)/bashrc ~/.bashrc

.PHONY: setup
