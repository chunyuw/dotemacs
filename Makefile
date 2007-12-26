### Makefile for .emacs.d by Chunyu Wang <chunyu@hit.edu.cn>

ALLFILES  = init.el gnus.el bbdb abbrev_defs diary bookmark/* sig/* tmpls/*.tpl msf/*-mode/*

Author    = Chunyu Wang <chunyu@hit.edu.cn>
Copyright = Copyright (C) $(shell seq -s, 2006 $(shell $(DATE) +%Y)) $(Author).

AUTOCSTR  = Batch checkin for .emacs.d ($(shell $(DATE) "+%Y-%m-%d %H:%M") on $(shell uname -n)).

ifeq ($(shell uname -s),"windows32") 
  DATE    = gdate
else 
  DATE    = date
endif

all:
	@echo "Usage:"
	@echo "    make ci/up/st/ps | clean"

up:;	svn update .
ci:;    svn commit . -m "$(AUTOCSTR)"
st:;	svn status .
ps:
	svn -q propset svn:eol-style LF $(ALLFILES)
	svn -q propset Author "$(Author)" $(ALLFILES)
	svn -q propset Copyright "$(Copyright)" $(ALLFILES)


clean:;	-$(RM) var/{ido.last,places,history} auto-save-list/.*~

# Local Variables:
# mode: makefile-gmake
# End:
