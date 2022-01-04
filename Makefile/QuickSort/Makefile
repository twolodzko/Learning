HEAD := $(firstword $(LIST))
TAIL := $(wordlist 2, $(words $(LIST)), $(LIST))

sort:
	@ $(MAKE) impl LIST="$(TAIL)" PIVOT="$(HEAD)" LEFT= RIGHT=

impl:
ifeq ($(PIVOT), )
	@ echo
else ifeq ($(LIST), )
	@ echo $(shell $(MAKE) LIST="$(LEFT)") $(PIVOT) $(shell $(MAKE) LIST="$(RIGHT)")
else ifeq ($(shell test $(HEAD) \< $(PIVOT); echo $$?), 0)
	@ $(MAKE) impl LIST="$(TAIL)" LEFT="$(LEFT) $(HEAD)" PIVOT="$(PIVOT)" RIGHT="$(RIGHT)"
else
	@ $(MAKE) impl LIST="$(TAIL)" LEFT="$(LEFT)" PIVOT="$(PIVOT)" RIGHT="$(HEAD) $(RIGHT)"
endif
