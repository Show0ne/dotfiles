eval "$(starship init zsh)"
alias ff='fastfetch'
export VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/lvp_icd.x86_64.json
GTK_THEME=Adwaita:light
export STARSHIP_CONFIG=/home/show/.config/starship.toml
export COLORTERM=truecolor
export TERM=foot
export PATH=$PATH:~/go/bin
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Fix Ctrl+Left / Ctrl+Right
# Fix Delete key
# Arrows + word navigation
# Delete key

# Ctrl+Alt+Shift+Left / Right -> beginning/end of line

# Ctrl+Alt+Shift+Up / Down -> beginning/end of buffer

# --- Arrow key combinations (clean set) ---

# Ctrl + arrows
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5A' up-line-or-history
bindkey '^[[1;5B' down-line-or-history

# Shift + arrows
bindkey '^[[1;2D' backward-char
bindkey '^[[1;2C' forward-char
bindkey '^[[1;2A' up-line-or-history
bindkey '^[[1;2B' down-line-or-history

# Ctrl + Shift + arrows
bindkey '^[[1;6D' backward-word
bindkey '^[[1;6C' forward-word
bindkey '^[[1;6A' up-line-or-history
bindkey '^[[1;6B' down-line-or-history

# Ctrl + Alt + arrows
bindkey '^[[1;7D' backward-word
bindkey '^[[1;7C' forward-word
bindkey '^[[1;7A' up-line-or-history
bindkey '^[[1;7B' down-line-or-history

# Ctrl + Alt + Shift + arrows

# Delete / Insert
bindkey '^[[3~' delete-char
bindkey '^[[2~' overwrite-mode


# --- Hard fix Ctrl/Alt/Shift arrows in all ZLE keymaps ---

for km in emacs viins vicmd; do
  bindkey -M "$km" '^[[1;5D' backward-word
  bindkey -M "$km" '^[[1;5C' forward-word
  bindkey -M "$km" '^[[1;5A' up-line-or-history
  bindkey -M "$km" '^[[1;5B' down-line-or-history

  bindkey -M "$km" '^[[1;6D' backward-word
  bindkey -M "$km" '^[[1;6C' forward-word
  bindkey -M "$km" '^[[1;6A' up-line-or-history
  bindkey -M "$km" '^[[1;6B' down-line-or-history

  bindkey -M "$km" '^[[1;7D' backward-word
  bindkey -M "$km" '^[[1;7C' forward-word
  bindkey -M "$km" '^[[1;7A' up-line-or-history
  bindkey -M "$km" '^[[1;7B' down-line-or-history


  bindkey -M "$km" '^[[3~' delete-char
  bindkey -M "$km" '^[[2~' overwrite-mode
done

function target() {
    if [ "$#" -eq 2 ]; then
        # Si pasas parámetros: target 10.10.11.1 "Nombre"
        echo "$2 $1" > ~/.config/waybar/target.txt
    else
        # Si no pasas nada, te avisa o limpia
        echo "Uso: target <IP> <NOMBRE>"
    fi
}

function untarget() {    # Limpia el archivo completamente
    echo "" > ~/.config/waybar/target.txt
}



# Usa $TARGET en cualquier comando
export TARGET=$(cat /tmp/target 2>/dev/null | awk '{print $1}')

# Ejemplo de uso: nmap -sCV $TARGET


source ~/.zsh-keyselect.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# Función para hacer backups con timestamp
function bak() {
    if [ -f "$1" ]; then 
    cp "$1" "$1.bak_$(date +%Y%m%d_%H%M%S)"
        echo "✅ Backup de $1 creado con éxito."
    else
        echo "❌ Error: El archivo $1 no existe."
    fi
}

alias dot='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
