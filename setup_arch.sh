#!/bin/bash
# Script de despliegue de Show0ne

echo "Iniciando despliegue de dotfiles..."

# Clonar el repo bare
git clone --bare git@github.com:Show0ne/dotfiles.git $HOME/.cfg

# Definir el alias temporalmente para el script
function dot {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}

# Checkout de los archivos
dot checkout
if [ $? = 0 ]; then
  echo "Checked out config."
else
  echo "Backing up pre-existing dotfiles."
  mkdir -p .dotfiles-backup
  dot checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .dotfiles-backup/{}
fi

dot checkout
dot config --local status.showUntrackedFiles no
echo "¡Sistema restaurado!"
