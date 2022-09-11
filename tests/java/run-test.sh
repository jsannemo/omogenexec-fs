#!/usr/bin/env bash

set -e

(cd /test;
javac hello.java;
java hello > output;
diff expected output;
)
