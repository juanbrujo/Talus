#!/bin/sh

# Set the colours you can use
black='\033[0;30m'
white='\033[0;37m'
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
magenta='\033[0;35m'
cyan='\033[0;36m'

#  Reset text attributes to normal + without clearing screen.
alias Reset="tput sgr0"

# Color-echo.
# arg $1 = message
# arg $2 = Color
cecho() {
  echo "${2}${1}"
  Reset # Reset to normal.
  return
}

echo ""
cecho "##############################################" $red
cecho "#         Please don't run this blindly       " $red
cecho "##############################################" $red
echo ""
echo "Agree?"
select yn in "Yes" "No"; do
  case $yn in
    Yes ) break;;
    No ) echo "byebye"; exit 1;;
  esac
done

# Install brew if is not already Installed
if test ! $(which brew); then
  	echo "Installing homebrew..."
  	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo ""
echo "Updating homebrew"
brew update
# Install GNU core utilities (those that come with OS X are outdated)

echo ""
echo "Installing GNU core utilities"
brew install coreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
echo ""
echo "Installing GNU find, locate, updatedb, and xargs, g-prefixed"
brew install findutils

# Install Bash 4
echo ""
echo "Installing Bash 4"
brew install bash

# Install more recent versions of some OS X tools
echo ""
echo "Installing more recent versions of some OS X tools"
brew tap homebrew/dupes
brew install homebrew/dupes/grep
echo 'export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"' >> ~/.zshrc

# Brew packages commonly used
binaries=(
 	wget
	curl
	ffmpeg
	node
	nginx
	nvm
)

echo "Installing binaries..."
brew install ${binaries[@]}

echo "Cleaning up"
brew cleanup

echo "Installing Oh-my-zsh "
wget --no-check-certificate http://install.ohmyz.sh -O - | sh

echo "Installing cask "
brew install caskroom/cask/brew-cask

# Alternate cask versions
brew tap caskroom/versions

# I like the symlinks to be in /Applications instead of the default cask config
echo 'export HOMEBREW_CASK_OPTS="--appdir=/Applications"' >> ~/.zshrc

# tmux, vim
brew install tmux
brew install vim

# Some cask apps
apps=(
	dropbox
	vlc
	vox
	the-unarchiver
	slack
	telegram
	rambox
	
)
echo "Installing apps..."
brew cask install ${apps[@]}

# Cask I use for development
devel_apps=(
	iterm2
	sublime-text
	macdown
	firefox
	google-chrome
	hyper
	sourcetree
	visual-studio-code
	sequel-pro
)
echo "Installing devel apps..."
brew cask install ${devel_apps[@]}

# Yarn
echo ""
echo "Installing Yarn"
brew install yarn

# Heroku
echo ""
echo "Installing Heroku-Toolbelt"
brew install heroku-toolbelt
brew install parity

# Databases
echo "Downloading Databases ..."
brew install mysql
brew info mysql
brew install postgresql
brew install redis

# Ruby
echo "Installing Ruby ..."
brew install rbenv
brew install ruby-build

echo "Configuring Ruby ..."
find_latest_ruby() {
  rbenv install -l | grep -v - | tail -1 | sed -e 's/^ *//'
}

ruby_version="$(find_latest_ruby)"
append_to_zshrc 'eval "$(rbenv init - --no-rehash)"' 1
eval "$(rbenv init -)"

if ! rbenv versions | grep -Fq "$ruby_version"; then
  RUBY_CONFIGURE_OPTS=--with-openssl-dir=/usr/local/opt/openssl rbenv install -s "$ruby_version"
fi

rbenv global "$ruby_version"
rbenv shell "$ruby_version"
gem update --system


echo ""
cecho "##############################################" $red
cecho "#         STARTING SYSTEM CONFIG SCRIPT      #" $red
cecho "##############################################" $red
echo ""
echo "Continue?"
select yn in "Yes" "No"; do
  case $yn in
    Yes ) break;;
    No ) echo "byebye"; exit 1;;
  esac
done

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo ""
echo "Saving to disk (not to iCloud) by default"
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

echo ""
echo "Disabling press-and-hold for keys in favor of a key repeat"
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

echo ""
echo "Setting a blazingly fast keyboard repeat rate (ain't nobody got time fo special chars while coding!)"
defaults write NSGlobalDomain KeyRepeat -int 0


# m-cli
echo "Installing m-cli ..."
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/rgcr/m-cli/master/install.sh | sh)"
echo "export PATH=$PATH:/usr/local/m-cli" >> ~/.profile
echo "export PATH=$PATH:/usr/local/m-cli" >> ~/.zshrc

###############################################################################
# Sublime Text
###############################################################################
echo ""
echo "Enable Sublime Text 2 command line?"
select yn in "Yes" "No"; do
case $yn in
Yes ) break;;
No ) echo "byebye"; exit 1;;
esac
done


###############################################################################
# m-cli
###############################################################################
echo ""
echo "Install m-cli? (Swiss Army Knife for Mac OS X)"
select yn in "Yes" "No"; do
case $yn in
Yes ) echo ""
echo "Installing m-cli"

break;;
No ) break;;
esac
done

###############################################################################
# Quicklook helpers
# List of useful Quick Look plugins for developers
# see: https://github.com/sindresorhus/quick-look-plugins
###############################################################################

echo ""
cecho "##############################################" $red
cecho "#         STARTING QUICKLOOK HELPERS         #" $red
cecho "##############################################" $red
echo ""
echo "Install s useful Quick Look plugins for developers"
echo "Continue?"
select yn in "Yes" "No"; do
  case $yn in
    Yes ) break;;
    No ) echo "byebye"; exit 1;;
  esac
done

# Cask I use for development
devel_quicklook=(
	qlcolorcode
	qlstephen
	qlmarkdown
	quicklook-json
	qlprettypatch
	quicklook-csv
	betterzipql
	qlimagesize
	webpquicklook
	suspicious-package
)
echo "Installing quicklook helpers..."
brew cask install ${devel_quicklook[@]}

echo ""
cecho "Done!" $white
echo ""
cecho "###############################################################################" $white
