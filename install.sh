#!/bin/bash

DOTPATH=~/.dotfiles

if has "git"; then
  git clone --recursive "https://github.com/Joju-Matsumoto/dotfiles.git" "$DOTPATH"
elif has "curl" || has "wget"; then
  tarball="https://codeload.github.com/Joju-Matsumoto/dotfiles/archive/main.tar.gz"

  if has "curl"; then
    curl -L "$tarball"
  elif has "wget"; then
    wget -O - "$tarball"
  fi | tar zxv
else
  die "curl or wget required."
fi

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
