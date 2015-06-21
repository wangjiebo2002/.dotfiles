DOTFILESDIR="$HOME/.dotfiles"
# clone .dotfiles
git clone https://github.com/countcain/.dotfiles.git "$DOTFILESDIR"


# soft link
function softlink {
  if [[ -L "$HOME/$1" || -s "$HOME/$1" ]]; then
    echo "$1 config file exist, make sure it link to $DOTFILESDIR/$1"
  else
    ln -s "$DOTFILESDIR/$1" "$HOME/$1"
  fi
}
softlink ".iterm2"
softlink ".zshenv"


# install powerline fonts (some theme depends on these fonts)
git clone https://github.com/powerline/fonts.git "$DOTFILESDIR/powerline-fonts"
sh "$DOTFILESDIR/powerline-fonts/install.sh"


# setup zsh with prezto
ZDOTDIR="$DOTFILESDIR/zsh"
git clone --recursive https://github.com/countcain/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done


# setup nvm
NVM_DIR="$DOTFILESDIR/nvm"
git clone https://github.com/creationix/nvm.git "$NVM_DIR" && cd "$NVM_DIR" && git checkout `git describe --abbrev=0 --tags`
