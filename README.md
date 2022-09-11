# OmogenExec Filesystem
Simple scripts for creating a filesystem to mount into for compiling and running programs in different languages.
Intended to be used as bind mounts for the [OmogenExec](https://github.com/jsannemo/omogenexec) sandboxing system.

## Supported languages
The languages that can be compiled and/or run within the filesystem are:
- C and C++ (with GCC)
- Python 3 (with PyPy)
- C# (with Mono)
- Java (with JDK 17)
- Rust
- Ruby
- Go
- JavaScript (with NodeJS)

## Building
To build the filesystems, run `build-all.sh`.
This creates a Zstsd compressed tarball of the filesystem for each language in `output`.

To see how to run and compile a certain language, see the commands in `tests/language/run-test.sh`.
