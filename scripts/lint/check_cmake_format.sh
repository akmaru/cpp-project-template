#!/bin/bash
set -euo pipefail

SCRIPT_DIR=$(cd $(dirname $0); pwd)
PROJECT_DIR=${SCRIPT_DIR}/../../

cmake-format --check CMakeLists.txt
find \
  ${PROJECT_DIR}/benchmark \
  ${PROJECT_DIR}/include \
  ${PROJECT_DIR}/src \
  ${PROJECT_DIR}/test \
  -type f -name "CMakeLists.txt" -o -name "*.cmake" | xargs cmake-format --check
