#!/usr/bin/env bash

set -e

(cd /test;
ruby hello.rb > output;
diff expected output;
)
