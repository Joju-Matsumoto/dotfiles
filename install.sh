#!/bin/bash

DOTPATH=~/.dotfiles

if [ ! -d $DOTPATH ]; then
  if type "git"; then
    git clone --recursive "https://github.com/Joju-Matsumoto/dotfiles.git" "$DOTPATH"
  elif type "curl" || type "wget"; then
    tarball="https://codeload.github.com/Joju-Matsumoto/dotfiles/archive/main.tar.gz"

    if type "curl"; then
      curl -L "$tarball"
    elif type "wget"; then
      wget -O - "$tarball"
    fi | tar zxv
  else
    die "curl or wget required."
  fi
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
