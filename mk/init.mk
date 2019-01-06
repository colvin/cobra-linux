# $COBRA$
#
# Copyright (c) 2019, Colvin Wellborn All rights reserved.

init: init-gitconfig

init-gitconfig:
	git config --local include.path ../.gitconfig
