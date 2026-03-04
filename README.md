# Logitech G915 TKL (ANSI) – XKB Layouts for Fedora/Linux

Custom keyboard layouts for the Logitech G915 TKL (ANSI US physical layout) using XKB.

## Why
- Keep **US ANSI physical mapping** (matches key legends on the G915 TKL US)
- Type **Portuguese** fast (ç, accents)
- Add **Spanish** (¿ ¡)
- Add **German** (ä ö ü ß)
- Provide **math/engineering** symbols
- Avoid classic US-Intl dead-key friction while programming

---

## Install

```bash
git clone <your_repo_url>
cd g915-xkb-layouts
./install.sh

---
## How to install
setxkbmap -layout myg915 -variant g915_altgr_deadless_plus_power

# If don't apply
sudo rm -rf /var/lib/xkb/*
logout
login



---

## `diagrams/keyboard-layout.md` (complete visual diagram)

> Este diagrama mostra: **Base / Shift / AltGr / Shift+AltGr** para as teclas mais relevantes (ANSI).  
> Para não virar um livro, eu detalho **tudo que foge do US padrão** + mostro a camada AltGr completa.

```md
# G915 TKL (ANSI) – Visual Map (Power Layout)

Legend:
- Base = normal
- Shift = with Shift
- AGr = AltGr (Right Alt)
- S+AGr = Shift+AltGr

## Top row (numbers)
` 1 2 3 4 5 6 7 8 9 0 - =
Base:     ` 1 2 3 4 5 6 7 8 9 0 - =
Shift:    ~ ! @ # $ % ^ & * ( ) _ +
AGr:      dead_grave   . .  £ € dead_circumflex . . . . – ≠
S+AGr:    dead_tilde   . .  . . € dead_circumflex . . . . — ±

Notes:
- AltGr+` gives dead_grave; Shift+AltGr+` gives dead_tilde
- AltGr+- gives en-dash, Shift+AltGr+- gives em-dash
- AltGr+= gives ≠, Shift+AltGr+= gives ±
- AltGr+4 gives ¢, Shift+AltGr+4 gives £
- AltGr+5 gives €

## QWERTY row
Q W E R T Y U I O P [ ] \
AGr changes:
- W -> ä (S+AGr: Ä)
- Y -> ü (S+AGr: Ü)
- P -> ö (S+AGr: Ö)
- [ -> ≤ (S+AGr: ←)
- ] -> ≥ (S+AGr: →)
- \ -> √ (S+AGr: logical OR)

## Home row
A S D F G H J K L ; '
AGr changes:
- A -> á (S+AGr: Á)
- S -> ß (S+AGr: ẞ)
- E -> é (S+AGr: É) [on E key]
- I -> í / ∞, ∫ on i (AGr: ∞ ; S+AGr: ∫)
- O -> ó (S+AGr: Ó)
- U -> ú (S+AGr: Ú)
- F -> ≈ (S+AGr: function symbol)
- ; -> ‘ (S+AGr: “)
- ' -> ’ (S+AGr: ”) plus AltGr dead keys: dead_acute / dead_diaeresis

## Bottom row
Z X C V B N M , . /
AGr changes:
- C -> ç (S+AGr: Ç)
- N -> ñ (S+AGr: Ñ)
- , -> × (S+AGr: ÷)
- . -> … (S+AGr: ·)
- / -> ¿ (S+AGr: ¡)

## Space
AGr:
- Space -> NBSP (no-break space)