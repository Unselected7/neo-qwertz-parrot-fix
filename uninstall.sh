#!/bin/bash

echo "=== Neo-QWERTZ Workaround Deinstallation ==="
echo ""

# Kill xcape
killall xcape 2>/dev/null

# Remove files
rm -f ~/.Xmodmap
rm -f ~/start-neo-qwertz.sh
rm -f ~/.config/autostart/neo-qwertz.desktop

# Reset to standard German layout
setxkbmap de

echo "✅ Deinstallation abgeschlossen!"
echo ""
echo "Standard deutsches Layout wiederhergestellt."
