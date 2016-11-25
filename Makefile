.PHONY : test
test: spec

.PHONY : spec
spec:
	crystal spec -v --fail-fast
