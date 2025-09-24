#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")"/.. && pwd)"
DIST_DIR="${ROOT_DIR}/dist"
PAK_NAME="hello-world"
OUTPUT="${DIST_DIR}/${PAK_NAME}.pak"

rm -f "${OUTPUT}"
mkdir -p "${DIST_DIR}"

( cd "${ROOT_DIR}/${PAK_NAME}" && zip -r "${OUTPUT}" . >/dev/null )

printf 'Created %s\n' "${OUTPUT}"
