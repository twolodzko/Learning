MAKEFLAGS += --no-print-directory
NUMBER:=0
CURRENT:=0
NEXT:=1

fibo:
ifeq ($(NUMBER), 0)
	echo $(CURRENT)
else
	$(MAKE) NUMBER=$(shell expr $(NUMBER) - 1) CURRENT=$(NEXT) NEXT=$(shell expr $(CURRENT) + $(NEXT))
endif
