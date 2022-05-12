#!/bin/sh

dotfiles_home=$(cd $(dirname $0)/.. && pwd)
echo $dotfiles_home

cd ${dotfiles_home}/dotfiles
for file in .??*; do
	ln -s ${PWD}/${file} ${HOME}
done

