$(eval $(register-npm-bin))

babel-src-dir = src
babel-dst-dir = lib

~babel-src-files = $(shell find $(babel-src-dir) -name '*.js' -o -name '*.jsx' 2>/dev/null)
~babel-dst-files = $(patsubst $(babel-src-dir)/%, $(babel-dst-dir)/%, $(~babel-src-files))

babel-opts =

main :: $(~babel-dst-files)

$(~babel-dst-files): $(babel-dst-dir)/%: $(babel-src-dir)/% .babelrc
	$(make-target-dir)
	babel $(babel-opts) -o $@ $<

babel-install-plugins:
	bae $(patsubst %, -p %, $(plugins)) $(patsubst %, -s %, $(presets))

babel-remove-plugins:
	bae -r $(patsubst %, -p %, $(plugins)) $(patsubst %, -s %, $(presets))

.PHONY: babel-install-plugins babel-remove-plugins
