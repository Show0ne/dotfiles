#!/bin/bash

RES=$(hyprctl monitors | grep -oP '\d+x\d+' | head -1)

if [[ "$RES" == "1920x1080" ]]; then
    # fullscreen → deja 1080p
    wlr-randr --output Virtual-1 --mode 1920x1080
else
    # ventana → deja dinámico (no tocar)
    :
fi
