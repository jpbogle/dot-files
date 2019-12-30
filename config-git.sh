#!/bin/bash
#git config --global include.path $HOME/.gitaliases
echo 'Writing git aliases...'
git config --global alias.lol 'log --graph --decorate --pretty=oneline --abbrev-commit --all'
git config --global alias.last 'log -1 HEAD'
