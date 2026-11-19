SCRIPT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

SHELL := bash
.SHELLFLAGS := -O globstar -eu -o pipefail -c

# highlight the Makefile targets
# @grep -E '^[a-zA-Z0-9_\-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: help
.DEFAULT_GOAL=help
help:  ## help for this Makefile
	@grep -E '^[a-zA-Z0-9_\-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "%-30s %s\n", $$1, $$2}'

.PHONY: markdownlint
markdownlint:  ## lint markdown files
	@# markdownlint --disable MD029 MD040 -- **/*.md
	@markdownlint --disable MD029 MD040 -i ubuntu-setup -i README.md \
		-i nix-install.md -- *.md

.PHONY: nixfmt
nixfmt:  ## format nix files
	@nixfmt *.nix

.PHONY: oxfmt
oxfmt: ## format files using oxfmt fl=<file>
	@test -n "$(fl)" || { echo "fl= not specified"; exit 1; }
	@test -f "$(fl)" || { echo "$(fl) does not exist"; exit 1; }
	oxfmt -- $(fl)

.PHONY: oxfmt-all
oxfmt-all: ## format files using oxfmt fl=<file>
	oxfmt $(shell fd -t f -g '*.md')

.PHONY: oxcheck
oxcheck: ## check files format using oxfmt
	oxfmt --check $(shell fd -t f -g '*.md')
