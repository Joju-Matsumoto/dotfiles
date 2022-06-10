#!/bin/bash

DOTPATH=~/.dotfiles/dotfiles

cd $DOTPATH
if [ $? -ne 0 ]; then
  die "not found: $DOTPATH"
  exit 1
fi

for f in .??*
do
  [ "$f" = ".git" ] && continue

  if [ -e "$HOME/$f" ]; then
    mv "$HOME/$f" "$HOME/$f.backup" && echo "backup: $f"
  fi

  ln -snvf "$DOTPATH/$f" "$HOME/$f" && echo "link: $f"
done
