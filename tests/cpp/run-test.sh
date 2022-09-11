#!/usr/bin/env bash

set -e

(cd /test;
g++ -std=c++23 -O2 -static hello.cpp;
./a.out > output;
diff expected output;
)
