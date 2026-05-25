#!/usr/bin/env bash
set -euo pipefail

MODE="${1:-vision}"

case "${MODE}" in
  vision)
    npx prism mock openapi.yaml -p 4010 --host 0.0.0.0
    ;;
  *)
    echo "Usage: scripts/start-prism-mock.sh [vision]"
    exit 1
    ;;
esac
