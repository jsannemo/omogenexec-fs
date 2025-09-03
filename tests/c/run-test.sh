#!/usr/bin/env bash

set -e

(cd /test;
gcc -std=c17 -O2 -static hello.c;
./a.out > output;
diff expected output;
)
