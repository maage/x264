#!/bin/sh -x
set -e

git clone git://git.videolan.org/x264.git -b stable x264

pushd x264

API=$(grep '#define X264_BUILD' x264.h | awk '{print $3}')
COMMIT=$(git rev-list HEAD -n1)
SHORTCOMMIT=$(echo ${COMMIT:0:7})
rm -fr .git

popd

tar -cJf x264-0.$API-$SHORTCOMMIT.tar.xz x264
rm -fr x264
