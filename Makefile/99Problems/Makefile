HEAD := $(firstword $(LIST))
TAIL := $(wordlist 2, $(words $(LIST)), $(LIST))

rev:  ## 5. Reverse a list.
ifeq ($(LIST), )
	@ echo $(ACC)
else
	@ $(MAKE) LIST="$(TAIL)" ACC="$(HEAD) $(ACC)"
endif

equal:
ifeq ($(A), $(B))
	@ echo 1
else
	@ echo 0
endif

ispalindrome: ## 6. Find out whether a list is a palindrome.
	@ $(MAKE) equal A="$(LIST)" B="$(shell $(MAKE) rev LIST="$(LIST)")"

compress: ## 8. Eliminate consecutive duplicates of list elements.
ifeq ($(LIST), )
	@ echo $(ACC) $(PREV)
else ifeq ($(HEAD), $(PREV))
	@ $(MAKE) compress LIST="$(TAIL)" PREV="$(HEAD)" ACC="$(ACC)"
else
	@ $(MAKE) compress LIST="$(TAIL)" PREV="$(HEAD)" ACC="$(PREV) $(ACC)"
endif

encode: ## 10. Run-length encoding of a list.
ifeq ($(LIST), )
	@ echo $(ACC) $(PREV) $(N)
else ifeq ($(HEAD), $(PREV))
	@ $(MAKE) rle LIST="$(TAIL)" ACC="$(ACC)" PREV="$(HEAD)" N=$(shell expr $(N) + 1)
else
	@ $(MAKE) rle LIST="$(TAIL)" ACC="$(ACC) $(PREV) $(N)" PREV="$(HEAD)" N=1
endif

decode: ## 12. Decode a run-length encoded list.
ifeq ($(LIST), )
	@ echo $(ACC)
else
	@ $(MAKE) decode LIST="$(wordlist 3, $(words $(LIST)), $(LIST))" ACC="$(ACC) $(shell $(MAKE) repeat ELEM=$(firstword $(LIST)) N=$(word 2, $(LIST)))"
endif

duplicate: ## 14. Duplicate the elements of a list.
ifeq ($(LIST), )
	@ echo $(ACC)
else
	@ $(MAKE) duplicate LIST="$(TAIL)" ACC="$(ACC) $(HEAD) $(HEAD)"
endif

repeat:
ifeq ($(N), 1)
	@ echo $(ELEM)
else
	@ $(MAKE) repeat ELEM="$(ELEM) $(firstword $(ELEM))" N=$(shell expr $(N) - 1)
endif

replicate: ## 15. Replicate the elements of a list a given number of times.
ifeq ($(LIST), )
	@ echo $(ACC)
else
	@ $(MAKE) replicate LIST="$(TAIL)" ACC="$(ACC) $(shell $(MAKE) repeat ELEM="$(HEAD)" N=$(N))" N=$(N)
endif

rotate: ## 19. Rotate a list N places to the left.
ifeq ($(LIST), )
	@ $(MAKE) rotate ACC= LIST="$(ACC)" N=$(N)
else ifeq ($(N), 0)
	@ echo $(LIST) $(ACC)
else
	@ $(MAKE) rotate ACC="$(ACC) $(HEAD)" LIST="$(TAIL)" N=$(shell expr $(N) - 1)
endif

range: ## 22. Create a list containing all integers within a given range.
ifeq ($(START), $(END))
	@ echo $(ACC) $(END)
else
	@ $(MAKE) range START=$(shell expr $(START) + 1) END=$(END) ACC="$(ACC) $(START)"
endif

help:
	@ grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
