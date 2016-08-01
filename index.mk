babel-src-dir = src
babel-dst-dir = lib

~babel-src-files = $(shell find $(babel-src-dir) -name '*.js' -o -name '*.jsx')
~babel-dst-files = $(patsubst $(SRC)/%, $(LIB)/%, $(~babel-src-files))

babel-opts =

$(~babel-dst-files): $(babel-dst-dir)/%: $(babel-src-dir)/%
	$(mkdir)
	babel $(babel-opts) -o $@ $<
