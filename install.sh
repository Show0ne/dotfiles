#!/bin/bash

# Este script asume que ya has clonado el repo bare en ~/.dotfiles
# y definido el alias 'dot'.

function dot {
   /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}

echo "📦 Restaurando configuración desde el repo bare..."
dot checkout

if [ $? -ne 0 ]; then
  echo "⚠️  Hubo conflictos al checkout. Asegúrate de que no haya archivos existentes que pisen los del repo."
fi

dot config --local status.showUntrackedFiles no
echo "✅ Configuración aplicada."
