
.PHONY: build test coverage clean help

build: tictactoe.byte ## Build the module

tictactoe.byte:
	ocamlbuild two_players.byte
	@ mv two_players.byte tictactoe.byte
	@ chmod +x tictactoe.byte

tests.byte:
	ocamlbuild -pkgs oUnit -use-ocamlfind tests.byte

test: clean tests.byte ## Run unit tests
	./tests.byte
	@ rm tests.byte

bisect0001.out: test

coverage: bisect0001.out ## Create test coverage report using bisect
	# `opam install bisect` first
	@ bisect-report -I _build -html report bisect0001.out

clean: ## Cleanup
	@ rm -rf _build
	@ rm -f bisect*.out
	@ rm -rf report/

help: ## Display this help
	@ grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
