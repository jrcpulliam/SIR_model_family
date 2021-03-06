%.makestuff:
	-cd $(dir $(ms)) && mv -f $(notdir $(ms)) .$(notdir $(ms))
	cd $(dir $(ms)) && git clone $(msrepo)/$(notdir $(ms)).git
	-cd $(dir $(ms)) && rm -rf .$(notdir $(ms))
	touch $@

msrepo = https://github.com/dushoff
gitroot = ./

-include local.mk
-include $(gitroot)/local.mk
export ms = $(gitroot)/makestuff

Makefile: $(ms)

$(ms):
	cd $(dir $(ms)) && git clone $(msrepo)/$(notdir $(ms)).git

$(subdirs):
	$(MAKE) -f $(ms)/repos.mk $($@)
	ln -s $($@) $@
