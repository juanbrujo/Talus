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
cecho "###############################################################" $cyan
cecho "# ▗▄▄▄▖▗▄▖ ▗▖   ▗▖ ▗▖ ▗▄▄▖     ▗▄▄▖▗▖  ▗▖▗▄▄▖▗▄▄▄▖▗▄▄▄▖▗▖  ▗▖ #" $cyan
cecho "#   █ ▐▌ ▐▌▐▌   ▐▌ ▐▌▐▌       ▐▌    ▝▚▞▘▐▌     █  ▐▌   ▐▛▚▞▜▌ #" $cyan
cecho "#   █ ▐▛▀▜▌▐▌   ▐▌ ▐▌ ▝▀▚▖     ▝▀▚▖  ▐▌  ▝▀▚▖  █  ▐▛▀▀▘▐▌  ▐▌ #" $cyan
cecho "#   █ ▐▌ ▐▌▐▙▄▄▖▝▚▄▞▘▗▄▄▞▘    ▗▄▄▞▘  ▐▌ ▗▄▄▞▘  █  ▐▙▄▄▖▐▌  ▐▌ #" $cyan
cecho "#  ▗▄▄▖▗▄▄▄▖▗▄▄▄▖▗▖ ▗▖▗▄▄▖      ▗▄▄▖ ▗▄▄▖▗▄▄▖ ▗▄▄▄▖▗▄▄▖▗▄▄▄▖  #" $cyan
cecho "# ▐▌   ▐▌     █  ▐▌ ▐▌▐▌ ▐▌    ▐▌   ▐▌   ▐▌ ▐▌  █  ▐▌ ▐▌ █    #" $cyan
cecho "#  ▝▀▚▖▐▛▀▀▘  █  ▐▌ ▐▌▐▛▀▘      ▝▀▚▖▐▌   ▐▛▀▚▖  █  ▐▛▀▘  █    #" $cyan
cecho "# ▗▄▄▞▘▐▙▄▄▖  █  ▝▚▄▞▘▐▌       ▗▄▄▞▘▝▚▄▄▖▐▌ ▐▌▗▄█▄▖▐▌    █    #" $cyan
cecho "###############################################################" $cyan
echo ""

echo "This script will:"
echo "- Configure Apache for localhost development"
echo "- Install Homebrew and system utilities"
echo "- Install development tools and applications"
echo "- Setup databases and programming languages"
echo "- Install web development NPM packages"
echo "- Configure macOS system settings"
echo "- Setup multi-language development environments"
echo "- Install design and productivity applications"
echo ""
echo "Agree to proceed?"
select yn in "Yes" "No"; do
  case $yn in
    Yes ) break;;
    No ) echo "Script cancelled. Goodbye."; exit 1;;
  esac
done

# Ask for the administrator password upfront for sudo operations
echo ""
echo "This script requires sudo privileges for some operations."
echo "Please enter your password when prompted."
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo ""
cecho "##############################################" $red
cecho "#         APACHE LOCALHOST CONFIGURATION     #" $red
cecho "##############################################" $red
echo ""
echo "Configure Apache for localhost development?"
select yn in "Yes" "No"; do
  case $yn in
    Yes ) 
      echo "Configuring Apache for localhost..."
      
      bin=$(basename "${0}")
      conf="/etc/apache2/httpd.conf"
      
      # make backup file
      n=1
      while [ -f "${conf}.bak.${n}" ]
      do
        let n=${n}+1
      done
      cp "${conf}" "${conf}.bak.${n}"
      
      # edit httpd.conf in place - uncomment out two lines
      sed -i ''                                                                 \
          -e '/^#.*[[:space:]]userdir_module[[:space:]]/s/^#*//'                \
          -e '/#Include \/private\/etc\/apache2\/extra\/httpd-userdir.conf/s/^#//'   \
          "${conf}"
      
      echo "INFO: Apache configuration updated."
      echo "INFO: ${bin}:"
      echo "INFO: ${bin}: check that this looks OK"
      echo "INFO: ${bin}: % cat /private/etc/apache2/extra/httpd-userdir.conf"
      echo "INFO: ${bin}:"
      cat /private/etc/apache2/extra/httpd-userdir.conf
      echo "INFO: ${bin}:"
      echo "INFO: ${bin}: in particular, that '/private/etc/apache2/users/*.conf' files look OK"
      ls /private/etc/apache2/users/*.conf
      echo "INFO: ${bin}:"
      echo "INFO: ${bin}: hint: check for /private/etc/apache2/users/${SUDO_USER}.conf"
      if [ -f "/private/etc/apache2/users/${SUDO_USER}.conf" ]
      then
        echo "INFO: ${bin}: /private/etc/apache2/users/${SUDO_USER}.conf exists. See if it is OK."
      else
        echo "INFO: ${bin}: /private/etc/apache2/users/${SUDO_USER}.conf does NOT exist."
      fi  
      echo "INFO: ${bin}:"
      echo "INFO: ${bin}: here is a sample conf file (with php and perl enabled)."
      echo "INFO: ${bin}:"
      cat<<!
<Directory "/Users/${SUDO_USER}/Sites/">
  Options Indexes MultiViews FollowSymLinks
  AllowOverride All
  Order allow,deny
  Allow from all
  Require all granted
  Options +ExecCGI
  AddHandler cgi-script .cgi .pl
</Directory>
!
      echo "INFO: ${bin}:"
      echo "INFO: ${bin}: restarting apache httpd"
      sudo apachectl restart
      echo "INFO: ${bin}: Apache configuration completed!"
      break;;
    No ) 
      echo "Skipping Apache configuration."
      break;;
  esac
done

echo ""
cecho "##############################################" $red
cecho "#           HOMEBREW & SYSTEM TOOLS          #" $red
cecho "##############################################" $red
echo ""

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
	git
	tree
	htop
	nano
	jq
	youtube-dl
	imagemagick
	graphviz
	plantuml
	awscli
	gcloud
	azure-cli
	python
	python3
	pip
	pip3
)

echo ""
echo "Installing binaries..."
brew install ${binaries[@]}

echo ""
cecho "##############################################" $red
cecho "#          DEVELOPMENT TOOLS & APPS          #" $red
cecho "##############################################" $red
echo ""

echo "Installing Oh-my-zsh"
wget --no-check-certificate http://install.ohmyz.sh -O - | sh

echo ""
echo "Installing cask"
brew install caskroom/cask/brew-cask

# Alternate cask versions
brew tap caskroom/versions

# I like the symlinks to be in /Applications instead of the default cask config
echo 'export HOMEBREW_CASK_OPTS="--appdir=/Applications"' >> ~/.zshrc

# tmux, vim
echo ""
echo "Installing tmux and vim"
brew install tmux
brew install vim

# Some cask apps
echo ""
cecho "Installing general applications..." $white
apps=(
	dropbox
	vlc
	spotify
	the-unarchiver
	slack
	transmit
	whatsapp
	spark-app
	notion
	affinity-designer
	figma
)
echo "Installing apps..."
brew cask install ${apps[@]}

# Cask I use for development
echo ""
cecho "Installing development applications..." $white
devel_apps=(
	firefox
	google-chrome
	arc
	visual-studio-code
	sequel-pro
	warp
	mamp
	docker-desktop
	postman
	github-desktop
)
echo "Installing devel apps..."
brew cask install ${devel_apps[@]}

echo ""
cecho "##############################################" $red
cecho "#          DATABASES & PROGRAMMING           #" $red
cecho "##############################################" $red
echo ""

# Yarn
echo "Installing Yarn"
brew install yarn

# Netlify
echo ""
echo "Installing Netlify CLI"
brew install netlify-cli

# Databases
echo ""
echo "Downloading Databases ..."
brew install mysql
brew info mysql
brew install postgresql
brew install redis

# Ruby
echo ""
echo "Installing Ruby ..."
brew install rbenv
brew install ruby-build

echo "Configuring Ruby ..."
find_latest_ruby() {
  rbenv install -l | grep -v - | tail -1 | sed -e 's/^ *//'
}

ruby_version="$(find_latest_ruby)"
append_to_zshrc() { 
  if grep -Fqs "$1" ~/.zshrc; then
    echo "Already in ~/.zshrc"
  else
    if [ "$2" = "1" ]; then
      echo "$1" >> ~/.zshrc
    else
      echo "$1" >> ~/.zshrc
    fi
  fi
}
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
cecho "#            WEB DEVELOPMENT TOOLS           #" $red
cecho "##############################################" $red
echo ""

echo "Installing global NPM packages for web development..."

echo ""
cecho "Install npm-check-updates -g"  $white
npm install -g npm-check-updates

echo ""
cecho "Install Webpack -g"  $white
npm install -g webpack

echo ""
cecho "Install Express -g"  $white
npm install -g express

echo ""
cecho "Install Express Generator -g"  $white
npm install -g express-generator

echo ""
cecho "Install React CLI -g"  $white
npm install -g create-react-app

echo ""
cecho "Install Docker -g"  $white
npm install -g docker

echo ""
cecho "Install Angular CLI -g"  $white
npm install -g @angular/cli

echo ""
cecho "Install VueJS CLI -g"  $white
npm install -g @vue/cli

echo ""
cecho "Install Vite -g"  $white
npm install -g vite

echo ""
cecho "Install TypeScript -g"  $white
npm install -g typescript

echo ""
cecho "Install Prettier -g"  $white
npm install -g prettier

echo ""
cecho "Install ESLint -g"  $white
npm install -g eslint

echo ""
cecho "Install Next.js CLI -g"  $white
npm install -g next

echo ""
cecho "Install Svelte CLI -g"  $white
npm install -g svelte-cli

echo ""
cecho "Install Gatsby CLI -g"  $white
npm install -g gatsby-cli

echo ""
cecho "Install Firebase CLI -g"  $white
npm install -g firebase-tools

echo ""
cecho "##############################################" $red
cecho "#             SYSTEM CONFIGURATION           #" $red
cecho "##############################################" $red
echo ""

echo "Configuring macOS system settings..."
echo ""

echo "Saving to disk (not to iCloud) by default"
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

echo ""
echo "Disabling press-and-hold for keys in favor of a key repeat"
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

echo ""
echo "Setting a blazingly fast keyboard repeat rate"
defaults write NSGlobalDomain KeyRepeat -int 0

echo ""
echo "Enable subpixel font smoothing on non-Apple LCDs"
defaults write NSGlobalDomain AppleFontSmoothing -int 2

echo ""
echo "Disable menu bar transparency"
defaults write NSGlobalDomain "AppleEnableMenuBarTransparency" -bool false

echo ""
echo "Show all filename extensions in Finder"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo ""
echo "Disable the 'Are you sure you want to open this application?' dialog"
defaults write com.apple.LaunchServices LSQuarantine -bool false

echo ""
echo "Automatically hide and show the Dock"
defaults write com.apple.dock autohide -bool true

echo ""
echo "Set Dock to auto-hide and remove the auto-hide delay"
defaults write com.apple.dock autohide-time-modifier -float 0.15

# m-cli
echo ""
echo "Installing m-cli (Swiss Army Knife for Mac OS X)..."
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/rgcr/m-cli/master/install.sh | sh)"
echo "export PATH=$PATH:/usr/local/m-cli" >> ~/.profile
echo "export PATH=$PATH:/usr/local/m-cli" >> ~/.zshrc

# Install additional development tools
echo ""
echo "Installing additional development tools..."
brew install git-extras
brew install tig
brew install hub
brew install the_silver_searcher
brew install ripgrep
brew install fd
brew install bat
brew install exa
brew install hyperfine
brew install httpie
brew install curl
brew install wget

echo ""
echo "Setting up Python environment..."
pip3 install --upgrade pip
pip3 install virtualenv
pip3 install pipenv
pip3 install poetry

echo ""
echo "Setting up Node.js environment..."
npm install -g n
npm install -g yarn
npm install -g pnpm

echo ""
echo "Installing global Python packages..."
pip3 install black
pip3 install flake8
pip3 install pylint
pip3 install mypy
pip3 install pytest
pip3 install ipython
pip3 install jupyter
pip3 install requests
pip3 install beautifulsoup4
pip3 install pandas
pip3 install numpy
pip3 install matplotlib
pip3 install flask
pip3 install django
pip3 install fastapi
pip3 install uvicorn

echo ""
echo "Installing Rust and Cargo..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source ~/.cargo/env

echo ""
echo "Installing Go..."
brew install go

echo ""
echo "Setting up Go environment..."
echo 'export GOPATH=$HOME/go' >> ~/.zshrc
echo 'export PATH=$PATH:$GOPATH/bin' >> ~/.zshrc
source ~/.zshrc

echo ""
echo "Installing popular Go packages..."
go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
go install github.com/swaggo/swag/cmd/swag@latest
go install github.com/cosmtrek/air@latest
go install github.com/onsi/ginkgo/ginkgo@latest

echo ""
cecho "##############################################" $red
cecho "#            QUICKLOOK HELPERS              #" $red
cecho "##############################################" $red
echo ""

echo "Install useful Quick Look plugins for developers?"
select yn in "Yes" "No"; do
  case $yn in
    Yes ) 
      # Cask quicklook plugins for development
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
      break;;
    No ) 
      echo "Skipping QuickLook helpers installation."
      break;;
  esac
done

echo ""
echo "Cleaning up Homebrew..."
brew cleanup

echo ""
cecho "##############################################" $red
cecho "#             SETUP COMPLETED!               #" $red
cecho "##############################################" $red
echo ""
cecho "Your system has been configured with:" $green
cecho "✓ Apache localhost configuration" $green
cecho "✓ Homebrew and GNU utilities" $green
cecho "✓ Development tools and applications" $green
cecho "✓ Databases (MySQL, PostgreSQL, Redis)" $green
cecho "✓ Programming languages (Ruby, Node.js, Python, Go, Rust)" $green
cecho "✓ Web development tools and NPM packages" $green
cecho "✓ CLI tools (Git, AWS, GCP, Azure)" $green
cecho "✓ Code editors and IDEs (VS Code, Sublime, etc.)" $green
cecho "✓ Design tools (Figma, Sketch, Affinity)" $green
cecho "✓ Communication apps (Slack, Discord, etc.)" $green
cecho "✓ System utilities and performance tools" $green
cecho "✓ macOS system optimizations" $green
cecho "✓ QuickLook developer plugins" $green
cecho "✓ Python development environment" $green
cecho "✓ Go development tools and linters" $green
echo ""
cecho "Some changes may require a terminal restart or new terminal window." $yellow
cecho "Please restart your terminal to load all new configurations." $yellow
echo ""
cecho "###############################################################################" $white
