#!/bin/bash

# strict mode
set -euo pipefail
IFS=$'\n\t'

find ./test/functional_testing/ -maxdepth 1 -type f -name '*.sh' -print | sort | xargs -L 1 bash
