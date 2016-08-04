$(eval $(register-npm-bin))

babel-src-dir = src
babel-dst-dir = lib

~babel-src-files = $(shell find $(babel-src-dir) -name '*.js' -o -name '*.jsx' 2>/dev/null)
~babel-dst-files = $(patsubst $(babel-src-dir)/%, $(babel-dst-dir)/%, $(~babel-src-files))

babel-opts =

main :: $(~babel-dst-files)

$(~babel-dst-files): $(babel-dst-dir)/%: $(babel-src-dir)/% .babelrc
	$(mkdir)
	babel $(babel-opts) -o $@ $<
