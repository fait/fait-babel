#!/bin/sh

if is-installing-package && [ ! -f ../../.babelrc ] ; then
	echo "⎆ installing fait-babel config"
	cp .babelrc ../../.babelrc
fi
