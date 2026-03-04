#!/usr/bin/env bash
set -euo pipefail

SYMBOLS_DST="/usr/share/X11/xkb/symbols/myg915"

echo "[1/2] Removing ${SYMBOLS_DST}"
sudo rm -f "${SYMBOLS_DST}"

echo "[2/2] Clearing XKB cache"
sudo rm -rf /var/lib/xkb/* || true

echo "Done."