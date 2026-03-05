#!/usr/bin/env bash
set -euo pipefail

SYMBOLS_DST="/usr/share/X11/xkb/symbols/g915"
EVDEV_XML="/usr/share/X11/xkb/rules/evdev.xml"
EVDEV_LST="/usr/share/X11/xkb/rules/evdev.lst"
XML_BAK="/usr/share/X11/xkb/rules/evdev.xml.g915.bak"
LST_BAK="/usr/share/X11/xkb/rules/evdev.lst.g915.bak"

echo "Removing G915 XKB layout..."

# Remove symbols file
sudo rm -f "$SYMBOLS_DST"

# Restore backups if present (strongest guarantee)
if [[ -f "$XML_BAK" ]]; then
  sudo cp -a "$XML_BAK" "$EVDEV_XML"
fi

if [[ -f "$LST_BAK" ]]; then
  sudo cp -a "$LST_BAK" "$EVDEV_LST"
fi

# Clear XKB cache
sudo rm -rf /var/lib/xkb/* || true

echo "Done. Logout/login (or reboot) to fully unload."