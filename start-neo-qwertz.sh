#!/bin/bash
# Neo-QWERTZ mit xcape

killall xcape 2>/dev/null
setxkbmap de

# Caps Lock zu ISO_Level3_Shift (Standard Level3 Modifier)
xmodmap -e "remove Lock = Caps_Lock"
xmodmap -e "keysym Caps_Lock = ISO_Level3_Shift"
xmodmap -e "add mod5 = ISO_Level3_Shift"

# Tastenbelegungen laden
xmodmap ~/.Xmodmap

# xcape: Caps alleine = Escape, Caps halten = Level3
xcape -e 'ISO_Level3_Shift=Escape' -t 200

echo "✓ Neo-QWERTZ aktiv (xcape)"
