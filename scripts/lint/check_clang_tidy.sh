#!/bin/bash
set -euo pipefail

if [ $# != 1 ]; then
  echo "Error: Not specified <build_dir>"
  echo "Usage: $0 <build_dir>"
  exit 1
fi

SCRIPT_DIR=$(cd $(dirname $0); pwd)
PROJECT_DIR=${SCRIPT_DIR}/../../
BUILD_DIR=$1
JOBS=8

FILES=`find \
  benchmark \
  include \
  src \
  test \
  -type f -name "*.h" -o -name "*.cc"`

run-clang-tidy -config-file=${PROJECT_DIR}/.clang-tidy -j ${JOBS} -p ${BUILD_DIR} ${FILES}
