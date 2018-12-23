#!/bin/bash

# disclaimer: this build script is currently working on a Mac, it's untested on
# Windows or Linux

WEBPACK_MODE=$NODE_ENV
if [ -z $WEBPACK_MODE ]; then
  WEBPACK_MODE="production"
fi

rm -rf tmp

babel src --out-dir tmp --extensions '.ts'

echo "webpack is building for $WEBPACK_MODE"
webpack ./tmp/somnus.js \
-o ./lib/somnus.js \
--output-library somnus \
--output-library-target commonjs \
--target node \
--mode $WEBPACK_MODE

cp src/somnus.d.ts lib/
