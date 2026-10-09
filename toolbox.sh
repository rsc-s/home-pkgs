#!/bin/bash

# sudo dnf group install c-development development-tools --assumeyes
sudo dnf install opam fish zsh clang gcc gcc-c++ make automake btop jq gh emacs stow eza fastfetch dot emacs-nw vim rustup ripgrep --assumeyes
sudo dnf install nix --exclude nix-daemon --assumeyes
