#!/bin/sh

export PATH="$HOME/.local/bin:$PATH"

# default programs
export BROWSER="zen"
export EDITOR="nvim"

# XDG user directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# bootstrap .zshrc to ~/.config/zsh/.zshrc, any other zsh config can also reside here
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# TODO: move other files, to make home directory cleaner.

