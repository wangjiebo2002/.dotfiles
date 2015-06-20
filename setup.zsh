# soft link
DOTFILESDIR="$HOME/.dotfiles"
ln -s "$DOTFILESDIR/.iterm2" "$HOME/.iterm2"
ln -s "$DOTFILESDIR/.zshenv" "$HOME/.zshenv"

# setup zsh
ZDOTDIR="$DOTFILESDIR/zsh"
git clone --recursive https://github.com/countcain/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
