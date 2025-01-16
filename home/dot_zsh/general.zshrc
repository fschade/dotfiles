### History {{{
  # Tell it where to save the history
  export HISTFILE=$HOME/.zsh_history
  # The number of lines from $HISTFILE to read at the start of an interactive session
  export HISTSIZE=10000
  # The number of lines of your history you want saved
  export SAVEHIST=10000

  # Ensure that commands are added to the history immediately
  setopt inc_append_history
  # Record the timestamp of each command in HISTFILE
  setopt extended_history
  # Skip duplicates while searching
  setopt hist_find_no_dups
### }}}


### Path {{{
  if [ ! "$PATH_LOADED" = "true" ]; then
    # Extend $PATH with Homebrew's sbin directory
    [ ! "$PATH" = "*/usr/sbin*" ] && export PATH="/usr/sbin:$PATH"
    [ ! "$PATH" = "*/usr/bin*" ] && export PATH="/usr/bin:$PATH"
    [ ! "$PATH" = "*/usr/local/sbin*" ] && export PATH="/usr/local/sbin:$PATH"
    [ ! "$PATH" = "*/usr/local/bin*" ] && export PATH="/usr/local/bin:$PATH"

    ### Homebrew {{{
      if [[ $OSTYPE == darwin* && $CPUTYPE == arm64 ]]; then
        if [ ! "$HOMEBREW_LOADED" = "true" ]; then
          eval $(/opt/homebrew/bin/brew shellenv)
          export HOMEBREW_LOADED="true"
        fi
      fi
      if [[ $OSTYPE == darwin* && $CPUTYPE == i386 ]]; then
        if [ ! "$HOMEBREW_LOADED" = "true" ]; then
          eval $(/usr/local/bin/brew shellenv)
          export HOMEBREW_LOADED="true"
        fi
      fi
    ### }}}

    # Extend $PATH with user's binary paths in home directory
    [ -d $HOME/.bin ] && export PATH="$HOME/.bin:$PATH"
    [ -d $HOME/bin ] && export PATH="$HOME/bin:$PATH"
    [ -d $HOME/.local/bin ] && export PATH="$HOME/.local/bin:$PATH"
    [ -d $HOME/scripts ] && export PATH="$HOME/scripts:$PATH"
    [ -d $HOME/.rbenv/bin ] && export PATH="$HOME/.rbenv/bin:$PATH"

    # Node.js
    if which volta > /dev/null; then
      export VOLTA_HOME=$HOME/.volta

      # Extend $PATH with volta's bin directory
      export PATH="$VOLTA_HOME/bin:$PATH"
    fi

    if which kubectl > /dev/null; then
      export PATH="$PATH:$HOME/.krew/bin"
    fi

    export PATH_LOADED="true"
  fi

  # Go PATH
  if which go > /dev/null; then
    export GOPATH=$HOME/go
  fi
### }}}

### Cargo {{{
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"
### }}}

### PNPM {{{
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
### }}}

### Misc {{{
  # Move to that directory, if a command is issued that can't be executed as a normal command and the command is the name of a directory.
  setopt auto_cd
  # Enable comments in interactive shell
  setopt interactive_comments

  if which zoxide > /dev/null; then
    eval "$(zoxide init zsh)"
  fi
### }}}
