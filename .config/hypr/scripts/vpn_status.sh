#!/bin/bash

# Intentamos extraer la IP de la interfaz tun0 (típica de OpenVPN/HTB)
VPN_IP=$(ip addr show tun0 2>/dev/null | grep -oP '(?<=inet\s)\d+(\.\d+){3}')

if [ -n "$VPN_IP" ]; then
    # Éxito: IP encontrada (Estamos en la red de HTB)
    echo "{\"text\": \"   $VPN_IP\", \"class\": \"connected\"}"
else
    # Fallo: Interfaz no encontrada
    echo '{"text": "   Disconnected", "class": "disconnected"}'
fi
