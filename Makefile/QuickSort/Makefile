MAKEFLAGS += --no-print-directory
HEAD := $(firstword $(LIST))
TAIL := $(wordlist 2, $(words $(LIST)), $(LIST))

lt = $(shell test $(1) \< $(2); echo $$?)

sort:
	@ $(MAKE) impl LIST="$(TAIL)" PIVOT="$(HEAD)" LEFT= RIGHT=

impl:
ifeq ($(PIVOT), )
	@ echo
else ifeq ($(LIST), )
	@ echo $(shell $(MAKE) LIST="$(LEFT)") $(PIVOT) $(shell $(MAKE) LIST="$(RIGHT)")
else ifeq ($(call lt, $(HEAD), $(PIVOT)), 0)
	@ $(MAKE) impl LIST="$(TAIL)" LEFT="$(LEFT) $(HEAD)" PIVOT="$(PIVOT)" RIGHT="$(RIGHT)"
else
	@ $(MAKE) impl LIST="$(TAIL)" LEFT="$(LEFT)" PIVOT="$(PIVOT)" RIGHT="$(HEAD) $(RIGHT)"
endif
