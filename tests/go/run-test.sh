#!/usr/bin/env bash

set -e

(cd /test;
go build hello.go;
./hello > output;
echo "Output: "
cat output
echo "Expeted: "
cat expected 
diff expected output
)
