#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

for i in $SCRIPT_DIR/watches/*.json; do
  base_name=$(basename $i)
  name=${base_name%.json}
  curl --fail -X PUT "${ES_URL}_xpack/watcher/watch/${name}" -H 'Content-Type: application/json'  --data-binary "@${i}"
done
