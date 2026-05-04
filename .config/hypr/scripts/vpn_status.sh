#!/bin/bash
if pgrep -x "openvpn" > /dev/null; then
    echo '{"text": "🔒 VPN", "class": "connected"}'
else
    echo '{"text": "🔓 NO VPN", "class": "disconnected"}'
fi
