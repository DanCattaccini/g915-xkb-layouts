#!/usr/bin/env bash
set -euo pipefail

SRC_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SYMBOLS_SRC="${SRC_DIR}/symbols/myg915"
SYMBOLS_DST="/usr/share/X11/xkb/symbols/myg915"

echo "[1/3] Installing symbols to ${SYMBOLS_DST}"
sudo install -m 0644 "${SYMBOLS_SRC}" "${SYMBOLS_DST}"

echo "[2/3] Clearing XKB cache"
sudo rm -rf /var/lib/xkb/* || true

echo "[3/3] Done."
echo
echo "Test examples:"
echo "  setxkbmap -layout myg915 -variant g915_altgr_deadless_plus_power"
echo "  setxkbmap -layout myg915 -variant g915_intl_prog"