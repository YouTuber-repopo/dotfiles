#!/bin/bash

DOTFILES_DIR=~/dotfiles/
CONFIGFILES_DIR=~/.config/

create_link() {
  local src=$1
  local dest=$2

  if [ -e "$dest" ]; then
    echo "Backing up existing $dest to $dest.backup"
    mv "$dest" "$dest.backup"
  fi

  ln -sf "$src" "$dest"
  echo "Created symlink: $dest -> $src"
}

create_link "$DOTFILES_DIR/nvim" "$CONFIGFILES_DIR/nvim"
create_link "$DOTFILES_DIR/fish" "$CONFIGFILES_DIR/fish"
create_link "$DOTFILES_DIR/starship.toml" "$CONFIGFILES_DIR/starship.toml"

echo "Dotfiles setup complete!"
