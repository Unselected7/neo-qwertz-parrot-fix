#!/bin/bash

echo "=== Neo-QWERTZ Workaround Installation ==="
echo ""

# Check if xcape is installed
if ! command -v xcape &> /dev/null; then
    echo "❌ xcape ist nicht installiert"
    echo "Bitte installieren mit: sudo apt install -y xcape"
    exit 1
fi

# Copy files
echo "📦 Kopiere Dateien..."
cp neo-qwertz.xmodmap ~/.Xmodmap
cp start-neo-qwertz.sh ~/start-neo-qwertz.sh
chmod +x ~/start-neo-qwertz.sh

# Create autostart directory if it doesn't exist
mkdir -p ~/.config/autostart

# Copy autostart file
cat > ~/.config/autostart/neo-qwertz.desktop << 'AUTOSTART'
[Desktop Entry]
Type=Application
Name=Neo-QWERTZ Layout
Exec=/home/$USER/start-neo-qwertz.sh
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Comment=Startet Neo-QWERTZ Layout mit xcape beim Login
AUTOSTART

# Replace $USER in autostart file
sed -i "s/\$USER/$USER/g" ~/.config/autostart/neo-qwertz.desktop
chmod +x ~/.config/autostart/neo-qwertz.desktop

echo "✅ Installation abgeschlossen!"
echo ""
echo "Layout aktivieren:"
echo "  ~/start-neo-qwertz.sh"
echo ""
echo "Beim nächsten Login wird das Layout automatisch geladen."
echo ""
read -p "Möchtest du das Layout jetzt aktivieren? (j/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[JjYy]$ ]]; then
    ~/start-neo-qwertz.sh
    echo ""
    echo "✅ Layout aktiviert!"
    echo "Teste: Caps Lock halten + e = ["
fi
