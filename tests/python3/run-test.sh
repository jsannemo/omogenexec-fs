#!/usr/bin/env bash

set -e

(cd /test;
pypy3 hello.py > output;
diff expected output;
)
