#!/bin/bash
set -euo pipefail

if [ $# != 1 ]; then
  echo "Error: Not specified <doxygen_version>"
  echo "Usage: $0 <doxygen_version>"
  exit 1
fi

version=$1

dst=/opt
dir=${dst}/doxygen-${version}
curl -fsSL https://www.doxygen.nl/files/doxygen-${version}.linux.bin.tar.gz | tar zx -C ${dst}
pushd ${dir} && make install && popd
