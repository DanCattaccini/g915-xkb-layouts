# Logitech G915 TKL (ANSI) – XKB Layouts for Fedora/Linux

Custom XKB keyboard layouts for the **Logitech G915 TKL** (ANSI US physical layout). Base and Shift stay standard US so coding is friction-free; all extra characters live on **AltGr** (Right Alt).

## Why

- **US ANSI** base matches the key legends on the G915 TKL US.
- **Portuguese**: ç (AltGr+C), áéíóú on vowels, ã/õ via dead tilde.
- **Spanish**: ¿ ¡ (AltGr+/), ñ (AltGr+N).
- **German**: ä ö ü ß on ergonomic keys (W, P, Y, S).
- **Math/engineering** (power variant): ≠ ± ≤ ≥ × ÷ √ ≈ and more.
- **No dead keys on Base** — `` ' " ` ~ ^ `` type normally; dead accents only when you hold AltGr.

## Variants

| Variant | Description |
|--------|-------------|
| `intl` | Classic US-International behaviour + AltGr+C = ç |
| `prog` | Deadless base, PT/ES/DE on AltGr (dev-first) |
| `power` | prog + math symbols + editorial typography **(recommended)** |
| `eurkey` | EurKEY-style, lighter than power |

## Install

```bash
chmod +x install.sh uninstall.sh rebuild.sh
./install.sh
```

Then add the layout in your desktop:

- **KDE (Wayland)**: System Settings → Input Devices → Keyboard → Layouts → Add → **Logitech G915 TKL (ANSI)** → choose variant (e.g. **power**).
- **Quick test (X11/XWayland)**: `setxkbmap -layout g915 -variant power`

If the new layout does not appear, clear the XKB cache and log out/in:

```bash
./rebuild.sh
# then logout and login
```

## Uninstall

```bash
./uninstall.sh
```

Log out and log in (or reboot) so the system stops using the layout.

## Full key map (power variant)

See **[Logitech G915 TKL (ANSI) - Power Layout Visual Map.md](Logitech%20G915%20TKL%20(ANSI)%20-%20Power%20Layout%20Visual%20Map.md)** for the complete AltGr layer, ASCII diagram, and sanity checklist.
