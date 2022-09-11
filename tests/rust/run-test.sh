#!/usr/bin/env bash

set -e

(cd /test;
rustc hello.rs;
./hello > output;
diff expected output;
)
