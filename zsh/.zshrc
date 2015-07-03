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

# node version manager
export NVM_DIR="$DOTFILESDIR/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# sets the tab title to current dir
precmd() {
  echo -ne "\e]1;${PWD##*/}\a"
}
