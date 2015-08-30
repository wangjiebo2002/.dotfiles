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
alias mongod="sudo mongod --dbpath /Volumes/Engineering/Mongodb_Data"
alias linode="ssh cain@cainhuang.com"

# node version manager
export NVM_DIR="$DOTFILESDIR/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
alias node='node --harmony'

# sets the tab title to current dir
precmd() {
  echo -ne "\e]1;${PWD##*/}\a"
}

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
