#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize your needs...
DOTFILESDIR="$HOME/.dotfiles"

# common update
alias ...=cd ../../
alias imgcat="$DOTFILESDIR/scripts/imgcat"

# server
alias linode="ssh countcain@cainhuang.com"
alias dafa="ssh -L 9080:localhost:9090 cainh@5.189.139.222"

# node version manager
export NVM_DIR="$DOTFILESDIR/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# sets the tab title to current dir
precmd() {
  echo -ne "\e]1;${PWD##*/}\a"
}

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

