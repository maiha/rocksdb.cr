API_IMPLS := src/rocksdb/api.cr
OPT_IMPLS := src/rocksdb/options.cr
CMD_TESTS := $(shell find spec -name '*_spec.cr')
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

doc/api/impl: $(API_IMPLS) $(OPT_IMPLS) Makefile
	grep -hv "^\s*#" $(API_IMPLS) | grep -Phoe "(api|try) (\w+)" | cut -d' ' -f2 | sort | uniq > $@
	grep -hv "^\s*#" $(OPT_IMPLS) | grep -Phoe "\boption (\w+)" | cut -d' ' -f2 | sed "s/^/rocksdb_options_/" | sort | uniq >> $@
	grep -hv "^\s*#" $(OPT_IMPLS) | grep -Phoe "\boption (\w+)" | cut -d' ' -f2 | sed "s/^/rocksdb_readoptions_/" | sort | uniq >> $@
	grep -hv "^\s*#" $(OPT_IMPLS) | grep -Phoe "\boption (\w+)" | cut -d' ' -f2 | sed "s/^/rocksdb_writeoptions_/" | sort | uniq >> $@

doc/api/test: $(CMD_TESTS) Makefile
	grep -hv "^\s*#" $(CMD_TESTS) | grep -Phoe '(it|describe) "#(\w+)' | cut -d'#' -f2 | sort | uniq > $@
