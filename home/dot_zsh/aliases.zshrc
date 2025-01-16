alias ~="cd ~/"
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"

alias grep="grep --color=auto"

alias l="ls"
alias ll="l -l"
alias la="l -a"
alias lla="ls -la"

# Pass credentials by default
alias ssh="ssh -A"

which chezmoi > /dev/null \
  && alias cz=chezmoi

which htop > /dev/null \
  && alias top=htop

which docker > /dev/null \
  && alias d=docker

which kubectl > /dev/null \
  && alias k=kubectl

which eza > /dev/null \
  && alias ls=eza

which lazygit > /dev/null \
  && alias g=lazygit
