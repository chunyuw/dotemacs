### Makefile for .emacs.d by Chunyu Wang <chunyu@hit.edu.cn>

ALLFILES  = init.el gnus.el bbdb abbrev_defs diary bookmark/* sig/* tmpls/*.tpl

Author    = "Chunyu Wang <chunyu@hit.edu.cn>"
Copyright = "Copyright (C) $(shell seq -s, 2006 $(shell $(DATE) +%Y)) "$(Author)"."

AUTOCSTR  = Batch checkin for .emacs.d ($(shell $(DATE) "+%Y-%m-%d %H:%M") on $(shell uname -n)).

ifeq ($(shell uname -s),"windows32") 
  DATE    = gdate
else 
  DATE    = date
endif

tt:
	@echo "$(AUTOCSTR)"

ci:;    svn commit . -m "$(AUTOCSTR)"

ps:
	svn ps svn:eol-style LF $(ALLFILES)
	svn ps Author $(Author) $(ALLFILES)
	svn ps Copyright $(Copyright) $(ALLFILES)

st:;	svn st .

# Local Variables:
# mode: makefile-gmake
# End:
