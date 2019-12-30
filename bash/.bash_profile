alias ls="ls -G"
alias ll="ls -l"
alias ns="npm start"
alias ni="npm install"
alias ed="electron ."

alias ga="git add ."
alias gc="git commit -m"
alias gp="git push origin master"
alias gs="git status"
alias gpull="git pull origin master"
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
  [ -r "$file" ] && source "$file"
done
unset file
