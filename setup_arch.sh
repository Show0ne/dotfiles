#!/bin/bash

# --- 1. Definición de Objetivos (Paquetes) ---
PACKAGES=(
    hyprland
    foot
    waybar
    wofi
    swww
    fastfetch
    zsh
    git
    openvpn
    curl
    nano
)

echo "🛡️ Iniciando el despliegue táctico de Show0ne..."

# --- 2. Instalación de Dependencias ---
echo "📦 Instalando binarios necesarios..."
sudo pacman -S --needed --noconfirm "${PACKAGES[@]}"

# --- 3. Recuperación del Corazón (Repo Bare) ---
if [ ! -d "$HOME/.cfg" ]; then
    echo "📡 Clonando base de datos de configuración..."
    git clone --bare git@github.com:Show0ne/dotfiles.git $HOME/.cfg
else
    echo "✅ El repo .cfg ya existe."
fi

# Definir función temporal para el script
function dot {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}

# --- 4. El Checkout (Desplegar archivos en su sitio) ---
echo "🔧 Restaurando archivos de configuración..."
dot checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .dotfiles-backup/{} 2>/dev/null
dot checkout

# --- 5. Hardening final ---
dot config --local status.showUntrackedFiles no
echo "🚀 ¡Sistema desplegado y configurado! Reinicia o lanza Hyprland."
