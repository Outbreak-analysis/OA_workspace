msrepo = https://github.com/dushoff
projectrepo = https://github.com/Outbreak-analysis

gitroot = ./
export ms = $(gitroot)/makestuff

-include local.mk
-include $(gitroot)/local.mk
export ms = $(gitroot)/makestuff
-include $(ms)/os.mk

projectdirs = who_ebola Ebola_presentation tmp_earlyForecast tmp_data tmp_SEIRF Zika WA_Ebola_Outbreak

Makefile: $(ms) 

all:	  $(projectdirs)

$(ms):
	cd $(dir $(ms)) && git clone $(msrepo)/$(notdir $(ms)).git

$(projectdirs): local.mk
	cd $(gitroot) && git clone $(projectrepo)/$(notdir $@).git
	cp local.mk $@

local.mk:
	echo gitroot = $(shell pwd) > $@

$(gitroot):
	mkdir $@
