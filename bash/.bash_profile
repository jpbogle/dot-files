alias ls="ls -aG"
alias ll="ls -al"
alias ns="npm start"
alias ni="npm install"
alias ed="electron ."

alias ga="git add ."
alias gc="git commit -m"
alias gp="git push origin master"
alias gs="git status"
alias gpull="git pull origin master"

alias json="python -m json.tool"

alias mvnidea="pushd ~/jingle/Jingle; ./mvnidea -r sources -p MZStore,MZStoreElements,MZStoreElements2,MZStorePlatform,MZSoftwareUpdate; popd;"

export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra,profile}; do
  [ -r "$file" ] && source "$file"
done
unset file

# added by Anaconda3 2019.10 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/jbogle/opt/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/Users/jbogle/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/jbogle/opt/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/Users/jbogle/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<
