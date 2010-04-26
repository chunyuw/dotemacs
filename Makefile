### Makefile for .emacs.d by Chunyu Wang <cymacs@gmail.com>

AUTOCSTR  = Batch checkin for .emacs.d ($(shell $(DATE) '+%Y-%m-%d %H:%M') on $(shell uname -n)).

ifeq ($(shell uname -s), windows32)
  DATE    = gdate
else 
  DATE    = date
endif

all:
	@echo "Usage:"
	@echo "    make pull/push/ci/up/st | clean"
	@echo "$(AUTOCSTR)"

up:;	bzr up
pull:;	bzr pull
push:;	bzr push
ci:;    bzr commit . -m "$(AUTOCSTR)"
st:;	bzr st


clean:;	-$(RM) -r {history,places,recentf,tramp} auto-save-list abbrev_defs

# Local Variables:
# mode: makefile-gmake
# End:
