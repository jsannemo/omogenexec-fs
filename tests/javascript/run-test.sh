#!/usr/bin/env bash

set -e

(cd /test;
node hello.js > output;
diff expected output;
)
