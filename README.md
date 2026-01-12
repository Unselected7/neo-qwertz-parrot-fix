# Neo-QWERTZ Workaround für Parrot OS

Workaround für das kaputte Neo-QWERTZ Layout auf Parrot OS, das i3 Window Manager kompatibel ist.

## Problem

Auf Parrot OS ist das native `neo_qwertz` Keyboard Layout defekt:
- Die Ebenen sind vertauscht (Ebene 4 und 5)
- Das Layout blockiert i3 Window Manager Tastenkombinationen
- Normale Buchstaben liegen auf der falschen Ebene

## Lösung

Diese Lösung verwendet:
- **Standard deutsches Tastaturlayout** als Basis
- **xmodmap** für Sonderzeichen auf Ebene 3
- **xcape** um Caps Lock als Modifier zu nutzen ohne i3 zu blockieren

### Features

✅ Normale deutsche QWERTZ Tastatur  
✅ Caps Lock (gedrückt halten) = Ebene 3 mit Sonderzeichen  
✅ i3 Window Manager funktioniert mit Windows-Taste (Mod4)  
✅ Automatischer Start beim Login  

## Installation

### Voraussetzungen

```bash
sudo apt update
sudo apt install -y xcape
```

### Installation

```bash
# Repository klonen
git clone https://github.com/DEIN-USERNAME/neo-qwertz-parrot-fix.git
cd neo-qwertz-parrot-fix

# Installation ausführen
./install.sh
```

### Manuell aktivieren

```bash
./start-neo-qwertz.sh
```

## Tastenbelegung Ebene 3

Halte **Caps Lock** gedrückt und drücke:

| Taste | Zeichen | Beschreibung |
|-------|---------|--------------|
| e | [ | Eckige Klammer auf |
| r | ] | Eckige Klammer zu |
| d | { | Geschweifte Klammer auf |
| f | } | Geschweifte Klammer zu |
| j | ( | Runde Klammer auf |
| k | ) | Runde Klammer zu |
| z | ! | Ausrufezeichen |
| h | ? | Fragezeichen |
| a | \ | Backslash |
| s | / | Slash |
| ö | : | Doppelpunkt |
| , | " | Anführungszeichen |
| . | ' | Apostroph |
| y | # | Raute |
| u | < | Kleiner als |
| i | > | Größer als |
| o | = | Gleichheitszeichen |
| p | & | Ampersand |
| g | * | Asterisk |
| l | - | Minus |
| n | + | Plus |
| m | % | Prozent |
| x | $ | Dollar |
| c | \| | Pipe |
| v | ~ | Tilde |
| b | ` | Backtick |

Vollständige Belegung siehe [KEYBINDINGS.md](KEYBINDINGS.md)

## i3 Window Manager

Die Windows-Taste (Super/Mod4) bleibt für i3 verfügbar:

- `Win + Enter` - Terminal öffnen
- `Win + d` - Rofi Launcher
- `Win + w` - Fenster schließen
- etc.

## Deinstallation

```bash
./uninstall.sh
```

Oder manuell:

```bash
killall xcape
rm ~/.Xmodmap
rm ~/start-neo-qwertz.sh
rm ~/.config/autostart/neo-qwertz.desktop
setxkbmap de
```

## Technische Details

### Wie funktioniert es?

1. **setxkbmap de** - Lädt Standard-Deutsch Layout
2. **xmodmap** - Definiert Caps Lock als ISO_Level3_Shift und mappt Sonderzeichen
3. **xcape** - Ermöglicht dass Caps Lock nur als Modifier funktioniert wenn gehalten
4. **mod5** - Caps Lock wird zu mod5 (ISO_Level3_Shift), nicht mod3 (Mode_switch)
5. **i3** - Bleibt bei mod4 (Super/Windows-Taste), wird nicht blockiert

### Warum nicht das native neo_qwertz?

Das native `setxkbmap de neo_qwertz` auf Parrot OS hat mehrere Bugs:
- Vertauschte Ebenen (4 und 5)
- Mode_switch blockiert i3 Tastenkombinationen
- Normale Buchstaben auf falscher Ebene

### Dateien

- `start-neo-qwertz.sh` - Haupt-Startskript
- `neo-qwertz.xmodmap` - Tastenbelegungen für Ebene 3
- `install.sh` - Installationsskript
- `uninstall.sh` - Deinstallationsskript
- `neo-qwertz.desktop` - Autostart-Datei

## Kompatibilität

Getestet auf:
- Parrot OS 6.x (Debian-basiert)
- i3 Window Manager

Sollte auch funktionieren auf:
- Debian 12+
- Ubuntu 22.04+
- Andere Debian-basierte Distributionen mit i3

## Troubleshooting

### Layout lädt nicht automatisch

```bash
~/start-neo-qwertz.sh
```

### Caps Lock funktioniert nicht als Modifier

Prüfe ob xcape läuft:
```bash
ps aux | grep xcape
```

Neu starten:
```bash
killall xcape
~/start-neo-qwertz.sh
```

### i3 reagiert nicht

Prüfe ob Mod4 gesetzt ist:
```bash
xmodmap -pm | grep mod4
```

Sollte zeigen: `mod4 Super_L (0x85), Super_R (0x86)...`

## Beitragen

Pull Requests sind willkommen! Für größere Änderungen bitte zuerst ein Issue öffnen.

## Lizenz

MIT License - siehe [LICENSE](LICENSE)

## Credits

Basiert auf dem offiziellen Neo-Layout: https://neo-layout.org/

## Links

- [Neo-Layout Website](https://neo-layout.org/)
- [Neo-Layout Repository](https://git.neo-layout.org/neo/neo-layout)
- [i3 Window Manager](https://i3wm.org/)
