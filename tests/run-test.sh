#!/usr/bin/env bash
set -eu

base_path=`dirname -- "$0"`

lang=$1
fs_path=$2

cp -r $base_path/$lang $fs_path/test

mkdir -p $fs_path/proc
mkdir -p $fs_path/tmp
mkdir -p $fs_path/dev
sudo mount -t proc /proc $fs_path/proc/
sudo mount --bind /dev $fs_path/dev/
set +e
sudo chroot $fs_path /bin/sh -c "chown -R omogentest /test; chmod u+x /test/run-test.sh; su omogentest -c 'bash /test/run-test.sh'"
ok=$?
set -e

sudo umount -l $fs_path/proc
sudo umount -l $fs_path/dev
rmdir $fs_path/proc
rmdir $fs_path/dev

rm -r $fs_path/test
rm -r $fs_path/tmp

if [ $ok -eq 0 ]
then
  echo "Test OK"
else
  echo "Test failed"
fi
