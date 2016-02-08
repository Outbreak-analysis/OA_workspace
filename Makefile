# OA_workspace
### Hooks for the editor to set the default target
current: target

target pngtarget pdftarget vtarget acrtarget: Makefile

##################################################################

# make files

Sources = Makefile .gitignore README.md init.mk LICENSE.md
include init.mk
# include $(ms)/perl.def

##################################################################

## Cloning

clone:
	git clone $(prejectrepos)/$(target).git
	$(MAKE) $(target)/stuff.mk


$(projectdirs):
	$(MAKE) target=$@ clone

######################################################################

### Makestuff

## Change this name to download a new version of the makestuff directory
# Makefile: start.makestuff

-include $(ms)/git.mk
-include $(ms)/visual.mk

# -include $(ms)/wrapR.mk
# -include $(ms)/oldlatex.mk
