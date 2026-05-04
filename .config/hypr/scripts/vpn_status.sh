#!/bin/bash
if pgrep -x "openvpn" > /dev/null; then
    # Estamos en el túnel (CONNECTED)
    echo '{"text": "   VPN", "class": "connected"}'
else
    # Fuera del túnel (DISCONNECTED)
    echo '{"text": "   VPN", "class": "disconnected"}'
fi
