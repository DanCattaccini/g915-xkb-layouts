#!/usr/bin/env bash
set -euo pipefail

echo "Clearing XKB cache (forces compositor rebuild)..."
sudo rm -rf /var/lib/xkb/* || true

echo "Done. Logout/login (or reboot) recommended on Wayland."
echo "X11/XWayland quick test:"
echo "  setxkbmap -layout g915 -variant power"