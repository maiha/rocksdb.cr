CMD_IMPLS := src/rocksdb/commands.cr
CMD_TESTS := $(shell find spec/commands -name '*.cr')
API_FILES := $(shell find doc/api -name '*.*')

.PHONY : all
all: API.md spec

.PHONY : test
test: spec

.PHONY : spec
spec:
	crystal spec -v --fail-fast

API.md: $(API_FILES) doc/api/list doc/api/impl doc/api/test Makefile
	crystal doc/api/doc.cr > API.md

doc/api/impl: $(CMD_IMPLS) Makefile
	grep -hv "^\s*#" $(CMD_IMPLS) | grep -Phoe "(normal|status) (\w+)" | cut -d' ' -f2 | sort | uniq > $@

doc/api/test: $(CMD_TESTS) Makefile
	grep -hv "^\s*#" $(CMD_TESTS) | grep -Phoe '(it|describe) "#(\w+)' | cut -d'#' -f2 | sort | uniq > $@
