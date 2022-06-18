MAKEFLAGS += --no-print-directory
NUMBER := 1
MAX := 100

ifeq ($(shell expr $(NUMBER) % 3), 0)
	ANSWER += "Fizz"
endif

ifeq ($(shell expr $(NUMBER) % 5), 0)
	ANSWER += "Buzz"
endif

ifeq ($(ANSWER), )
	ANSWER += "$(NUMBER)"
endif

fizzbuzz:
	@ echo $(ANSWER)
ifneq ($(NUMBER), $(MAX))
	@ $(MAKE) NUMBER="$(shell expr $(NUMBER) + 1)"
endif
