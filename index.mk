$(register-npm-bin)
$(call require, fait-macro)

# Directory to look for source Javascript files (determined by `$(babel-extensions)`).
babel-src-dir = src
# Directory to put compiled Javascript files.
babel-dst-dir = lib
# Extensions that we consider "Javascript source files". `.js` and `.jsx` by default.
babel-extensions = .js .jsx

~babel-extension-find-args = $(patsubst %, -name '*%' -o, $(babel-extensions)) -false
~babel-src-files = $(shell find $(babel-src-dir) $(~babel-extension-find-args) 2>/dev/null)
~babel-dst-files = $(patsubst $(babel-src-dir)/%, $(babel-dst-dir)/%, $(~babel-src-files))

# Options to pass to Babel.
babel-opts =

# Default entry target.
babel: $(~babel-dst-files)

-include $(~module-dir)babel.mk

# Install Babel plugins and write to `.babelrc`. Configured by the variables
# `$(plugins)` and `$(presets)`, which you should pass on the command line.
#
# If you want to e.g. install `babel-preset-es2015` and
# `babel-plugin-transform-runtime`, the command would be
# `make babel-install-plugins presets+=es2015 plugins+=transform-runtime`.
#
# If you install `transform-runtime`, `babel-runtime` is also installed.
#
# Uses [`@quarterto/bae`](https://github.com/quarterto/bae) under the hood.
babel-install-plugins:
	bae $(patsubst %, -p %, $(plugins)) $(patsubst %, -s %, $(presets))

# Same as `babel-install-plugins` but uninstalls and removes things from `.babelrc`
# instead.
babel-remove-plugins:
	bae -r $(patsubst %, -p %, $(plugins)) $(patsubst %, -s %, $(presets))

.PHONY: babel-install-plugins babel-remove-plugins

fait-babel-version := $(module-version)