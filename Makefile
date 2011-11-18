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
	@echo "    $(AUTOCSTR)"

up:;	@git update-index
pull:;	@git pull
push:;	@git push
ci:;    @git commit -a -m "$(AUTOCSTR)"
st:;	@git status
sync:   pull push

clean:
	-@$(RM) -rv {history,places,recentf,tramp} 
	-@$(RM) -rv auto-save-list abbrev_defs ede-projects.el 
	-@$(RM) -rv image-dired srecode-map.el url semanticdb tutorial

# Local Variables:
# mode: makefile-gmake
# End:
