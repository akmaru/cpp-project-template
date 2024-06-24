#!/bin/bash
set -euo pipefail

if [ $# != 1 ]; then
  echo "Error: Not specified <build_dir>"
  echo "Usage: $0 <build_dir>"
  exit 1
fi

SCRIPT_DIR=$(cd $(dirname $0); pwd)
BUILD_DIR=$1

${SCRIPT_DIR}/check_clang_format.sh
${SCRIPT_DIR}/check_clang_tidy.sh ${BUILD_DIR}
${SCRIPT_DIR}/check_cmake_format.sh
