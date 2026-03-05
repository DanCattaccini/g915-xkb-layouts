# Logitech G915 TKL (ANSI) — Power Layout Visual Map
Layout: **g915**, variant: **power**

This layout is **US ANSI** on Base/Shift (no surprises for coding).
All additions live on **AltGr** (Right Alt), keeping the default layer deadless.

Legend:
- Base = normal
- Shift = with Shift
- AltGr = Right Alt
- S+AltGr = Shift + Right Alt

## Quick principles
- Coding punctuation stays normal: `' " ` ~ ^` are NOT dead keys on Base/Shift.
- Dead accents exist only on AltGr:
  - AltGr+`  -> dead_grave
  - AltGr+Shift+` -> dead_tilde
  - AltGr+'  -> dead_acute
  - AltGr+Shift+' -> dead_diaeresis

---

## Full keyboard (ANSI) — Base/Shift reference (US)
This is your physical G915 TKL US legend and behaves exactly like US:

Row1:  ` 1 2 3 4 5 6 7 8 9 0 - =
Row2:  q w e r t y u i o p [ ] \
Row3:  a s d f g h j k l ; '
Row4:  z x c v b n m , . /
Space: space

(Shift produces the usual US: ~ ! @ # $ % ^ & * ( ) _ +, etc.)

---

## AltGr layer — what changes (the actual added symbols)

### Accents (dead keys only on AltGr)
- AltGr + `              = dead_grave   (then a -> à, e -> è, etc.)
- S + AltGr + `          = dead_tilde   (then a -> ã, o -> õ)
- AltGr + '              = dead_acute   (then a -> á, e -> é)
- S + AltGr + '          = dead_diaeresis (then u -> ü)

### Portuguese (fast)
- AltGr + C              = ç
- S + AltGr + C          = Ç
- AltGr + A/E/I/O/U      = á/é/í/ó/ú
- S + AltGr + A/E/I/O/U  = Á/É/Í/Ó/Ú
- For ã/õ use the AltGr tilde dead key: S+AltGr+` then a/o.

### Spanish
- AltGr + /              = ¿
- S + AltGr + /          = ¡
- AltGr + N              = ñ
- S + AltGr + N          = Ñ

### German
To avoid conflicts with Portuguese acute vowels, umlauts are on nearby mnemonic keys:
- AltGr + W              = ä
- S + AltGr + W          = Ä
- AltGr + P              = ö
- S + AltGr + P          = Ö
- AltGr + Y              = ü
- S + AltGr + Y          = Ü
- AltGr + S              = ß
- S + AltGr + S          = ẞ

### Editorial / Typography
- AltGr + Space          = NBSP (no-break space)
- AltGr + ;              = ‘  (left single quote)
- S + AltGr + ;          = “  (left double quote)
- AltGr + L              = ’  (right single quote)
- S + AltGr + L          = ”  (right double quote)
- *(The apostrophe key ' keeps dead_acute / dead_diaeresis from prog; smart quotes are on ; and L.)*
- AltGr + -              = –  (en dash)
- S + AltGr + -          = —  (em dash)
- AltGr + .              = …  (ellipsis)
- S + AltGr + .          = ·  (middle dot)

### Currency
- AltGr + 5              = €
- AltGr + 4              = ¢
- S + AltGr + 4          = £

### Math / Engineering
- AltGr + =              = ≠
- S + AltGr + =          = ±
- AltGr + [              = ≤
- S + AltGr + [          = ←
- AltGr + ]              = ≥
- S + AltGr + ]          = →
- AltGr + ,              = ×
- S + AltGr + ,          = ÷
- AltGr + \              = √
- S + AltGr + \          = ∨  (logical or)
- AltGr + F              = ≈
- S + AltGr + F          = ƒ

---

## ASCII diagram (AltGr highlights)

Top row:
`  1 2 3 4 5 6 7 8 9 0  -  =
AGr: dead_grave      ¢ €         –  ≠
S+AGr: dead_tilde    £ €         —  ±

QWERTY row:
q  w   e  r t y   u i o p   [  ]   \
AGr:   ä  é      ü  ú  í  ó  ö   ≤  ≥   √
S+AGr: Ä  É      Ü  Ú  Í  Ó  Ö   ←  →   ∨

Home row:
a  s   d f g h j k l  ;   '
AGr: á  ß     ≈         ‘   dead_acute
S+AGr:Á  ẞ     ƒ         “   dead_diaeresis

*(Smart quotes: ; = ‘ “, L = ’ ”. Apostrophe key = dead accents only.)*

Bottom row:
z x c v b n  m  ,  .  /
AGr:    ç    ñ     ×  …  ¿
S+AGr:  Ç    Ñ     ÷  ·  ¡

Space:
AGr: NBSP

---

## Sanity test checklist
1) **Code**: type `'hello'` and `"hello"` and `~/.config` without any “dead key hang”.
2) **Portuguese**: AltGr+c => ç; AltGr+a => á; AltGr+i => í; S+AltGr+` then a => ã.
3) **Spanish**: AltGr+/ => ¿.
4) **German**: AltGr+w => ä; AltGr+s => ß.
5) **Math**: AltGr+= => ≠; AltGr+\ => √.
