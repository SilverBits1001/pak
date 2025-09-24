#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")"/.. && pwd)"
DIST_DIR="${ROOT_DIR}/dist"
PAK_NAME="hello-world"
OUTPUT="${DIST_DIR}/${PAK_NAME}.pak"

usage() {
  cat <<EOF
Usage: ${0##*/} [TARGET_DIRECTORY]

Builds ${PAK_NAME}.pak into the dist/ folder. If TARGET_DIRECTORY is
provided the freshly built pak will also be copied into that directory.
This is handy when the TrimUI SD card is mounted on your computer, e.g.:

    ${0##*/} /media/trimui/roms/paks

EOF
}

if [[ $# -gt 1 ]]; then
  usage >&2
  exit 1
fi

TARGET_DIR="${1:-}"

rm -f "${OUTPUT}"
mkdir -p "${DIST_DIR}"

( cd "${ROOT_DIR}/${PAK_NAME}" && zip -r "${OUTPUT}" . >/dev/null )

printf 'Created %s\n' "${OUTPUT}"

if [[ -n "${TARGET_DIR}" ]]; then
  if [[ ! -d "${TARGET_DIR}" ]]; then
    printf 'Error: target "%s" is not a directory.\n' "${TARGET_DIR}" >&2
    exit 1
  fi
  install_path="${TARGET_DIR%/}/${PAK_NAME}.pak"
  cp "${OUTPUT}" "${install_path}"
  printf 'Copied to %s\n' "${install_path}"
fi
