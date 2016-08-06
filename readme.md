<h1 align="center">
	<img alt="fait×babel" height="75" src="logo.png">
</h1>
<h4 align="center">make target for babel compilation</h4>

## installation

fait-babel requires [fait](https://github.com/quartert/fait). Install them both with:

```sh
npm install --save-dev fait fait-babel
```

fait will create a barebones `makefile`: to load fait-babel, add:

```makefile
$(call require, fait-babel)
```

## Usage

Run `make babel` to compile Javascript files from `src` into `lib`. fait-babel uses `.babelrc` your current working directory (and creates an skeleton `.babelrc` if you don't have one).

To add plugins or presets, run `make babel-install-plugins plugins+=plugin presets+=preset`, where `plugin` and `preset` are the names of what you want to install (minus the leading `babel-preset-` or `babel-plugin-`). You can install multiple plugins or presets at once.

## Documentation
### Rules

#### 📄 `babel` ⬅️ `$(~babel-dst-files)` [🔗](index.mk#L18)

Default entry target.

#### 📑 `$(~babel-dst-files)`: `$$(babel-dst-dir)/%` ⬅️ `$$(babel-src-dir)/% .babelrc` [🔗](index.mk#L21)

Compile all `$(babel-src-dir)` Javascript files to `$(babel-dst-dir)`.

#### 📃 `babel-install-plugins` [🔗](index.mk#L35)

Install Babel plugins and write to `.babelrc`. Configured by the variables
`$(plugins)` and `$(presets)`, which you should pass on the command line.

If you want to e.g. install `babel-preset-es2015` and
`babel-plugin-transform-runtime`, the command would be
`make babel-install-plugins presets+=es2015 plugins+=transform-runtime`.

If you install `transform-runtime`, `babel-runtime` is also installed.

Uses [`@quarterto/bae`](https://github.com/quarterto/bae) under the hood.

#### 📃 `babel-remove-plugins` [🔗](index.mk#L40)

Same as `babel-install-plugins` but uninstalls and removes things from `.babelrc`
instead.

### Variables

#### 🚩 `$(babel-src-dir)` [🔗](index.mk#L4)

Directory to look for source Javascript files (determined by `$(babel-extensions)`).

#### 🚩 `$(babel-dst-dir)` [🔗](index.mk#L6)

Directory to put compiled Javascript files.

#### 🚩 `$(babel-extensions)` [🔗](index.mk#L8)

Extensions that we consider "Javascript source files". `.js` and `.jsx` by default.

#### 🚩 `$(babel-opts)` [🔗](index.mk#L15)

Options to pass to Babel.


## Licence
MIT
