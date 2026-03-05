#!/usr/bin/env bash
set -euo pipefail

# What this script does:
# 1) Installs the XKB symbols file to /usr/share/X11/xkb/symbols/g915
# 2) Registers the layout + variants in evdev.xml + evdev.lst (so KDE/GNOME can list them)
# 3) Clears the compiled XKB cache so the compositor rebuilds keymaps

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

SYMBOLS_SRC="${ROOT}/symbols/g915"
SYMBOLS_DST="/usr/share/X11/xkb/symbols/g915"

EVDEV_XML="/usr/share/X11/xkb/rules/evdev.xml"
EVDEV_LST="/usr/share/X11/xkb/rules/evdev.lst"

XML_BAK="/usr/share/X11/xkb/rules/evdev.xml.g915.bak"
LST_BAK="/usr/share/X11/xkb/rules/evdev.lst.g915.bak"

MARK_BEGIN="<!-- G915-XKB-BEGIN -->"
MARK_END="<!-- G915-XKB-END -->"

XML_SNIPPET="$(cat <<'EOF'
<!-- G915-XKB-BEGIN -->
<layout>
  <configItem>
    <name>g915</name>
    <shortDescription>G915</shortDescription>
    <description>Logitech G915 TKL (ANSI)</description>
    <languageList>
      <iso639Id>eng</iso639Id>
    </languageList>
  </configItem>
  <variantList>
    <variant>
      <configItem>
        <name>intl</name>
        <description>G915: US-Intl (classic) + AltGr+C=ç</description>
      </configItem>
    </variant>
    <variant>
      <configItem>
        <name>prog</name>
        <description>G915: US AltGr-deadless (dev) + PT/ES/DE</description>
      </configItem>
    </variant>
    <variant>
      <configItem>
        <name>power</name>
        <description>G915: POWER (AltGr-deadless) PT/ES/DE + Math + Editorial</description>
      </configItem>
    </variant>
    <variant>
      <configItem>
        <name>eurkey</name>
        <description>G915: EurKEY-style (light)</description>
      </configItem>
    </variant>
  </variantList>
</layout>
<!-- G915-XKB-END -->
EOF
)"

LST_SNIPPET="$(cat <<'EOF'
# G915-XKB-BEGIN
! layout
g915            Logitech G915 TKL (ANSI)

! variant
  intl          g915: US-Intl (classic) + AltGr+C=ç
  prog          g915: US AltGr-deadless (dev) + PT/ES/DE
  power         g915: POWER (AltGr-deadless) PT/ES/DE + Math + Editorial
  eurkey        g915: EurKEY-style (light)
# G915-XKB-END
EOF
)"

explain() {
  echo
  echo "== $1 =="
}

backup_once() {
  local src="$1"
  local bak="$2"
  if [[ ! -f "$bak" ]]; then
    sudo cp -a "$src" "$bak"
  fi
}

remove_marked_block() {
  # Removes everything between markers (inclusive) from a file
  local file="$1"
  sudo perl -0777 -i -pe "s/\Q$MARK_BEGIN\E.*?\Q$MARK_END\E\s*//s" "$file" 2>/dev/null || true
  # For evdev.lst markers are different (#), handle separately there when used
}

remove_marked_block_lst() {
  local file="$1"
  sudo perl -0777 -i -pe "s/\Q# G915-XKB-BEGIN\E.*?\Q# G915-XKB-END\E\s*//s" "$file" 2>/dev/null || true
}

insert_into_xml_if_missing() {
  local file="$1"
  if sudo grep -q "<name>g915</name>" "$file"; then
    return 0
  fi
  # Insert before </layoutList>
  sudo perl -0777 -i -pe "s#</layoutList>#${XML_SNIPPET}\n</layoutList>#s" "$file"
}

append_to_lst_if_missing() {
  local file="$1"
  if sudo grep -q "^g915[[:space:]]" "$file"; then
    return 0
  fi
  # Append block at end
  echo "$LST_SNIPPET" | sudo tee -a "$file" >/dev/null
}

explain "1) Installing symbols file"
# install -m 0644 sets permissions:
#   6 = read+write for owner
#   4 = read for group
#   4 = read for others
# /usr/share/... requires sudo because it's system-wide.
sudo install -m 0644 "$SYMBOLS_SRC" "$SYMBOLS_DST"

explain "2) Backing up rules (once)"
backup_once "$EVDEV_XML" "$XML_BAK"
backup_once "$EVDEV_LST" "$LST_BAK"

explain "3) Registering layout in evdev.xml and evdev.lst"
# First remove old marker blocks if they exist (idempotent)
remove_marked_block "$EVDEV_XML"
remove_marked_block_lst "$EVDEV_LST"

# Insert/append
insert_into_xml_if_missing "$EVDEV_XML"
append_to_lst_if_missing "$EVDEV_LST"

explain "4) Clearing compiled XKB cache"
# rm -r = recursive remove; -f = force (no prompts). This forces rebuild.
sudo rm -rf /var/lib/xkb/* || true

echo
echo "Installed."
echo
echo "KDE Wayland: System Settings -> Input Devices -> Keyboard -> Layouts -> Add -> 'Logitech G915 TKL (ANSI)'"
echo "Then select variant: intl / prog / power / eurkey"
echo
echo "Quick test (X11 or XWayland only):"
echo "  setxkbmap -layout g915 -variant power"