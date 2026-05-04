#!/bin/bash

# Host → VM
wl-paste --watch xclip -selection clipboard -in &

# VM → Host
xclip -selection clipboard -o | wl-copy --watch &
