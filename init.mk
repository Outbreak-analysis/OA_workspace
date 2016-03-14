msrepo = https://github.com/dushoff
projectrepo = https://github.com/Outbreak-analysis

gitroot = ./
export ms = $(gitroot)/makestuff

-include local.mk
-include $(gitroot)/local.mk
export ms = $(gitroot)/makestuff
-include $(ms)/os.mk

projectdirs = who_ebola Ebola_presentation tmp_earlyForecast tmp_data tmp_SEIFR Zika WA_Ebola_Outbreak hybrid_fitting OA_Planning

gitdirs = $(projectdirs:%=$(gitroot)/%)

Makefile: $(ms) 

all: $(ms) $(gitdirs)

$(ms):
	cd $(dir $(ms)) && git clone $(msrepo)/$(notdir $(ms)).git

local.mk:
	echo gitroot = $(shell pwd) > $@

$(gitdirs): 
	cd $(gitroot) && git clone $(projectrepo)/$(notdir $@).git

links: 
	$(link) $(gitdirs) .

$(gitroot):
	mkdir $@
