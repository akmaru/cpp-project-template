#!/bin/bash
set -euo pipefail

SCRIPT_DIR=$(cd $(dirname $0); pwd)
PROJECT_DIR=${SCRIPT_DIR}/../../

find \
  ${PROJECT_DIR}/benchmark \
  ${PROJECT_DIR}/include \
  ${PROJECT_DIR}/src \
  ${PROJECT_DIR}/test \
  -type f -name "*.h" -o -name "*.cc" | xargs clang-format --dry-run -Werror
