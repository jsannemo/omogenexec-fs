#!/usr/bin/env bash

set -e

(cd /test;
mono-csc hello.cs;
mono /test/hello.exe > output;
diff expected output;
)
