DOTFILESDIR="$HOME/.dotfiles"

function setupDotfiles(){
echo "\n"
echo -e "\033[45;33m SETUP $1 \033[0m"
}
function questionEcho(){
echo -e "\033[41;33m $1 \033[0m"
}


# clone .dotfiles
setupDotfiles "github.com/countcain/.dotfiles.git"
git clone https://github.com/countcain/.dotfiles.git "$DOTFILESDIR"


# soft links for .iterm2, .zshenv, .sqliterc
function softlink {
  if [[ -L "$HOME/$1" || -s "$HOME/$1" ]]; then
    echo "$1 config file exist, make sure it link to $DOTFILESDIR/$1"
  else
    ln -s "$DOTFILESDIR/$1" "$HOME/$1"
  fi
}
setupDotfiles ".iterm2"
softlink ".iterm2"
setupDotfiles ".zshenv"
softlink ".zshenv"
setupDotfiles ".sqliterc"
softlink ".sqliterc"


# install powerline fonts (some theme depends on these fonts)
setupDotfiles "github.com/powerline/fonts.git"
git clone https://github.com/powerline/fonts.git "$DOTFILESDIR/powerline-fonts"
sh "$DOTFILESDIR/powerline-fonts/install.sh"


# toggle iTerm Dock icon
function toggleiTerm() {
  local pb='/usr/libexec/PlistBuddy'
  local iTerm='/Applications/iTerm.app/Contents/Info.plist'
  questionEcho "Do you wish to hide iTerm in Dock?"
  select ync in "Hide" "Show" "Cancel"; do
    case $ync in
      'Hide' )
         $pb -c "Add :LSUIElement bool true" $iTerm
         echo "relaunch iTerm to take effectives"
         break
         ;;
      'Show' )
         $pb -c "Delete :LSUIElement" $iTerm
         echo "run killall 'iTerm' to exit, and then relaunch it"
         break
         ;;
      'Cancel' )
         break
         ;;
    esac
  done
}
setupDotfiles ".iterm2 dock"
toggleiTerm


# setup git
setupDotfiles "git global config"
questionEcho "Git core editor ? (such as vim)"
read git_core_editor
git config --global core.editor $git_core_editor
questionEcho "Git user name ?"
read git_user_name
git config --global user.name $git_user_name
questionEcho "Git user email ?"
read git_user_email
git config --global user.email $git_user_email


# setup zsh with prezto
setupDotfiles "zsh with prezto"
ZDOTDIR="$DOTFILESDIR/zsh"
git clone --recursive https://github.com/countcain/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done


# setup nvm
setupDotfiles "node version manager"
NVM_DIR="$DOTFILESDIR/nvm"
git clone https://github.com/creationix/nvm.git "$NVM_DIR" && cd "$NVM_DIR" && git checkout `git describe --abbrev=0 --tags`
