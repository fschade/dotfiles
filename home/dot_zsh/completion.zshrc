autoload bashcompinit && bashcompinit

if which brew > /dev/null; then
  fpath+=$(brew --prefix)/share/zsh/site-functions
fi

mkdir -p "$HOME/.zfunc"
fpath+="$HOME/.zfunc"

# Enable `volta` auto completion
which volta > /dev/null \
  && volta completions zsh > "$HOME/.zfunc/_volta"

# Enable `skaffold` auto completion
which skaffold > /dev/null \
  && eval "$(skaffold completion zsh)"

# Enable `kaf` auto completion
which kaf > /dev/null \
  && kaf completion zsh > "$HOME/.zfunc/_kaf"

autoload -Uz compinit && compinit
