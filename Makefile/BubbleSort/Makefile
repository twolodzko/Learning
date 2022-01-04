FIRST := $(firstword $(LIST))
SECOND := $(word 2, $(LIST))
TAIL := $(wordlist 3, $(words $(LIST)), $(LIST))

ifeq ($(shell test -z $(SECOND) || test $(FIRST) \< $(SECOND); echo $$?), 0)
LEFT := $(FIRST)
RIGHT := $(SECOND)
else
LEFT := $(SECOND)
RIGHT := $(FIRST)
endif

sort:
ifeq ($(LIST), )
	@ echo $(UNSORTED) $(SORTED)
else ifeq ($(RIGHT), )
	$(MAKE) UNSORTED= LIST="$(UNSORTED)" SORTED="$(LEFT) $(SORTED)"
else
	$(MAKE) UNSORTED="$(UNSORTED) $(LEFT)" LIST="$(RIGHT) $(TAIL)" SORTED="$(SORTED)"
endif
