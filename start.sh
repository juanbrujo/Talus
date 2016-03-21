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

# Brew packages that I use a lot
binaries=(
 	wget
	curl
	ffmpeg
	node
	nginx
)

echo "Installing binaries..."
brew install ${binaries[@]}

echo "cleaning up"
brew cleanup

echo "Installing Oh-my-zsh "
wget --no-check-certificate http://install.ohmyz.sh -O - | sh

echo "Installing cask "
brew install caskroom/cask/brew-cask
# Alternate cask versions
brew tap caskroom/versions
# I like the symlinks to be in /Applications instead of the default cask config
echo 'export HOMEBREW_CASK_OPTS="--appdir=/Applications"' >> ~/.zshrc
#
# Some cask apps that I use.
apps=(
	dropbox
	disk-inventory-x
	mplayerx
	vlc
	skype
	airmail-amt
	transmit
	vox
	iresize
	mou
	paparazzi
	the-unarchiver
	unrarx
	miro-video-converter
	adium
	evernote
	torbrowser
	transmission
	slack
	sip
	telegram
)
echo "installing apps..."
brew cask install ${apps[@]}

# Cask I use for development
devel_apps=(
	iterm
	atom
	sublime-text
	macdown
	firefox
	google-chrome
	opera
	virtualbox
	github-desktop
)
echo "installing devel apps..."
brew cask install ${devel_apps[@]}

echo "download mysql..."
brew install mysql

echo ""
cecho "##############################################" $red
cecho "#         STARTING SYSTEM CONFIG SCRIPT 		#" $red
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

###############################################################################
# Sublime Text
###############################################################################
echo ""
echo "Enable Sublime Text 2 command line?"
select yn in "Yes" "No"; do
  case $yn in
    Yes ) echo ""
        echo "Linking Sublime Text command line"
        ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
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
cecho "#         STARTING QUICKLOOK HELPERS 		#" $red
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
echo "installing quicklook helpers..."
brew cask install ${devel_quicklook[@]}

echo ""
cecho "Done!" $white
echo ""
cecho "###############################################################################" $white
