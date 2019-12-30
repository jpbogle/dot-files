#!/bin/bash

print_success() {
  printf "\e[0;32m  [✔] %s\e[0m\n" "$1"
}

print_error() {
  printf "\e[0;31m  [✖] Failed to unlink %s %s\e[0m\n" "$1" "$2"
}

print_question() {
  # Print output in yellow
  printf "\e[0;33m  [?] %s\e[0m" "$1"
}

execute() {
  $1 &> /dev/null
  print_result $? "${2:-$1}"
}

print_result() {
  if [ "$1" -eq 0 ]; then
    print_success "$2"
  else
    print_error "$2"
  fi

  [ "$3" == "true" ] && [ "$1" -ne 0 ] && exit
}

ask_for_confirmation() {
  print_question "$1 [y/N] "
  read -r -n 1
  printf "\n"
}

answer_is_yes() {
  [[ "$REPLY" =~ ^[Yy]$ ]] \
    && return 0 \
    || return 1
}

link_file() {
  local sourceFile=$1
  local targetFile=$2

  if [ ! -e "$targetFile" ]; then
    execute "ln -fs $sourceFile $targetFile" "$targetFile → $sourceFile"
  elif [ "$(readlink "$targetFile")" == "$sourceFile" ]; then
    print_success "$targetFile → $sourceFile"
  else
    ask_for_confirmation "'$targetFile' already exists, do you want to overwrite it?"
    if answer_is_yes; then
      rm -rf "$targetFile"
      execute "ln -fs $sourceFile $targetFile" "$targetFile → $sourceFile"
    else
      print_error "$targetFile → $sourceFile"
    fi
  fi
}

#ln -sf $(pwd)/git/.gitaliases $HOME/.gitaliases

#mkdir -p $HOME/.config/fish
#ln -sf $(pwd)/fish/functions "$HOME/.config/fish"
#ln -sf $(pwd)/fish/config.fish "$HOME/.config/fish/config.fish"

#ln -sf $(pwd)/bin $HOME

link_file "$(pwd)/vim/.vim" "$HOME/.vim"
link_file "$(pwd)/vim/.vimrc" "$HOME/.vimrc"
