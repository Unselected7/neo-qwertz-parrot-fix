
# Neo-QWERTZ Workaround for Parrot OS

This repository provides a workaround to make the broken native `neo_qwertz` keyboard layout functional on Parrot OS 7. Instead of fixing the flawed layout, a functional Neo-QWERTZ-like Level 3 layout is newly implemented based on the **standard German (DE) layout**. This solution is fully compatible with the i3 Window Manager, whose requirements hindered other approaches.
**NOTE**: This solution is limited to the X Window System. It does not work under Wayland.

## Problem

On Parrot OS, the native `neo_qwertz` keyboard layout is defective:

- The levels are swapped
- The layout also blocks i3 Window Manager key combinations

## Solution

This solution bypasses the problems of the native Neo-QWERTZ layout by building a reliable and functional Level 3. It uses:

- **Standard German keyboard layout** as a base
- **xmodmap** to remap keys and assign special characters to Level 3
- **xcape** to use Caps Lock as a modifier (for Neo-QWERTZ Level 3) and simultaneously – practical for Vim users – as an Escape key when pressed briefly.

### Features

✅ Standard German QWERTZ keyboard
✅ Caps Lock (hold down) = Level 3 with special characters
✅ i3 Window Manager works with Windows key (Mod4)
✅ Automatic startup at login

## Installation

### Prerequisites

```bash
sudo apt update
sudo apt install -y xcape
```

### Installation

```bash
# Clone the repository
git clone https://github.com/Unselected7/neo-qwertz-parrot-fix.git
cd neo-qwertz-parrot-fix

# Run installation
./install.sh
```

### Manual Activation

```bash
./start-neo-qwertz.sh
```

## Key Assignments Level 3

Hold **Caps Lock** and press:

| Key | Character | Description |
|-------|---------|--------------|
| e | [ | Opening square bracket |
| r | ] | Closing square bracket |
| d | { | Opening curly bracket |
| f | } | Closing curly bracket |
| j | ( | Opening parenthesis |
| k | ) | Closing parenthesis |
| z | ! | Exclamation mark |
| h | ? | Question mark |
| a | \ | Backslash |
| s | / | Slash |
| ö | : | Colon |
| , | " | Double quotes |
| . | ' | Apostrophe / Single quote |
| y | # | Hash / Pound sign |
| u | < | Less than |
| i | > | Greater than |
| o | = | Equals sign |
| p | & | Ampersand |
| g | * | Asterisk |
| l | - | Minus |
| n | + | Plus |
| m | % | Percent |
| x | $ | Dollar |
| c | \| | Pipe |
| v | ~ | Tilde |
| b | ` | Backtick |

Full key assignment see [KEYBINDINGS.md](KEYBINDINGS.md)

## i3 Window Manager Compatibility

A major problem with the native Neo-QWERTZ on Parrot OS was the blocking of i3 key combinations. This solution ensures that the Windows key (Super/Mod4) remains fully available for i3, so standard bindings like the following continue to work:

- `Win + Enter` - Open terminal
- `Win + d` - Rofi Launcher
- `Win + w` - Close window
- and more...

## Uninstallation

```bash
./uninstall.sh
```

Or manually:

```bash
killall xcape
rm ~/.Xmodmap
rm ~/start-neo-qwertz.sh
rm ~/.config/autostart/neo-qwertz.desktop
setxkbmap de
```

## Technical Details

### How it works?

1. **setxkbmap de** - Loads standard German layout
2. **xmodmap** - Defines Caps Lock as ISO_Level3_Shift and maps special characters
3. **xcape** - Allows Caps Lock to function as a modifier only when held (and as Escape when pressed briefly)
4. **mod5** - Caps Lock becomes mod5 (ISO_Level3_Shift), not mod3 (Mode_switch)
5. **i3** - The Windows key (Super/Mod4) remains available for i3 and is not blocked.

*Note: This solution uses X Window System-specific tools (`xmodmap`, `xcape`) and is therefore primarily designed for Xorg-based environments (like i3 on Debian/Ubuntu). It does not work directly under Wayland.*

### Why not the native neo_qwertz?

The native `setxkbmap de neo_qwertz` on Parrot OS has several bugs:

- Swapped levels (4 and 5)
- Mode_switch blocks i3 key combinations
- Normal letters on the wrong level

### Files

- `start-neo-qwertz.sh` - Main startup script
- `neo-qwertz.xmodmap` - Key assignments for Level 3
- `install.sh` - Installation script
- `uninstall.sh` - Uninstallation script
- `neo-qwertz.desktop` - Autostart file

## Compatibility

Tested on:

- Parrot OS 7.x (Debian-based) with i3 Window Manager configured

Should also work on other systems that still use the X Window System:

- Debian 12+
- Ubuntu 22.04+
- Other Debian-based distributions with i3

## Troubleshooting

### Layout does not load automatically

```bash
~/start-neo-qwertz.sh
```

### Caps Lock does not work as a modifier

Check if xcape is running:

```bash
ps aux | grep xcape
```

Restart:

```bash
killall xcape
~/start-neo-qwertz.sh
```

### i3 does not respond

Check if Mod4 is set:

```bash
xmodmap -pm | grep mod4
```

Should show: `mod4 Super_L (0x85), Super_R (0x86)...`

## Contributing

Pull Requests are welcome! For major changes, please open an issue first.

## License

MIT License - see [LICENSE](LICENSE)

## Credits

Based on the official Neo-Layout: <https://neo-layout.org/>

## Links

- [Neo-Layout Website](https://neo-layout.org/)
- [Neo-Layout Repository](https://git.neo-layout.org/neo/neo-layout)
- [i3 Window Manager](https://i3wm.org/)
- [Parrot OS](https://www.parrotsec.org/)
