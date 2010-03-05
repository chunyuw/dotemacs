### Makefile for .emacs.d by Chunyu Wang <cymacs@gmail.com>

ALLFILES  = init.el gnus.el diary .dired bookmark/* tmpls/*.tpl msf/*-mode/*

Author    = Chunyu Wang <cymacs@gmail.com>
Copyright = Copyright (C) $(shell seq -s, 2002 $(shell $(DATE) +%Y)) $(Author).

AUTOCSTR  = Batch checkin for .emacs.d ($(shell $(DATE) "+%Y-%m-%d %H:%M") on $(shell uname -n)).

ifeq ($(shell uname -s), windows32)
  DATE    = gdate
else 
  DATE    = date
endif

all:
	@echo "Usage:"
	@echo "    make pull/push/ci/up/st | clean"

up:;	bzr pull .
pull:;	bzr pull .
push:;	bzr push
ci:;    bzr commit . -m "$(AUTOCSTR)"
st:;	bzr status .


clean:;	-$(RM) {zido.last,zplaces.el,zhistory} auto-save-list/.*~

.PHONY:	all up ci st ps clean

# Local Variables:
# mode: makefile-gmake
# End:
