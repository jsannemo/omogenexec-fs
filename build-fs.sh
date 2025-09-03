#!/usr/bin/env bash
set -eu

base_path=`dirname -- "$0"`
lang=$1
output_path=$base_path/output/$lang

echo "Building common filesystem"
docker build $base_path/dockerfiles --file $base_path/dockerfiles/common-fs.Dockerfile -t omogen/common-fs

rm -rf $output_path
mkdir -p $output_path

echo "Building filesystem for $lang"
docker build $base_path/dockerfiles --file $base_path/dockerfiles/$lang-fs.Dockerfile -t omogen/$lang-fs
docker rm omogen-$lang-fs || true
container_id=`docker create --name omogen-$lang-fs omogen/$lang-fs`

echo "Exporting filesystem for $lang"
mkdir -p $output_path/full
(cd $output_path/full; docker export $container_id | tar x)


mkdir -p $output_path/fs
mv $output_path/full/{bin,etc,lib,lib64,sbin} $output_path/fs

mkdir -p $output_path/fs/usr
mv $output_path/full/usr/{bin,include,lib,libexec,lib64,sbin,share} $output_path/fs/usr

echo "Testing filesystem for $lang"
set +e
./tests/run-test.sh $lang $output_path/fs
ok=$?
set -e

if [ $ok -eq 0 ]
then
  echo "Creating compressed file system for $lang"
  tar --zstd -cf $base_path/output/omogen-$lang-fs.tar.zst -C $output_path/fs . 
  rm -rf $output_path
fi
