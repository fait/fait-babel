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
