# Talus System Setup Script

![Talus Robot](https://robohash.org/talus)

Talus is a comprehensive bash script to automate the download & setup of your macOS development environment. The idea is to automate the tedious work of setting up a brand new Mac or starting a fresh install with special care for web development tools, multi-language programming environments, and system configurations.

## 🚀 Quick Start

**Clone the repository and run the comprehensive setup:**

```bash
$ git clone https://github.com/juanbrujo/Talus.git && cd Talus
$ chmod a+x setup.sh
$ ./setup.sh
```

**That's it!** The script will guide you through the entire setup process with interactive prompts.

> For more visual App and Libraries installs, try [InstallKit](https://www.installkit.app/).

---

## ✨ What Talus Sets Up

### 🏠 **System Foundation**
- [Homebrew](http://brew.sh/) & [Cask](http://caskroom.io/)
- [Oh my zsh](http://ohmyz.sh/)
- GNU core utilities (coreutils, findutils, bash 4, grep)
- m-cli (Swiss Army Knife for macOS)

### 💻 **Core Development Tools**
- **Version Control:** git, git-extras, tig, hub
- **Text Editors:** vim, nano, VS Code, Sublime Text
- **Terminal Tools:** tmux, htop, tree, jq, httpie
- **Search Tools:** the_silver_searcher, ripgrep, fd, bat, exa
- **Performance Tools:** hyperfine, imagemagick, graphviz

### 🌐 **Web Development**
- **Runtime:** Node.js, npm, yarn, pnpm
- **CLI Tools:** TypeScript, Prettier, ESLint, webpack
- **Frameworks:** React (create-react-app), Angular CLI, Vue CLI, Svelte CLI, Next.js CLI, Gatsby CLI
- **Build Tools:** Vite, Gulp, Grunt, Yeoman
- **Cloud Services:** Firebase CLI, Heroku CLI, Netlify CLI
- **Web Servers:** nginx, Apache configuration for localhost

### 🗄️ **Databases**
- MySQL
- PostgreSQL  
- Redis
- MAMP (for local development)

### 🐍 **Programming Languages**
- **Python:** pip, virtualenv, pipenv, poetry + popular packages (black, flask, django, fastapi, pandas, numpy)
- **Ruby:** rbenv, ruby-build, latest Ruby version
- **Go:** Go installation + golangci-lint, swag, air, ginkgo
- **Rust:** rustup, cargo + development environment
- **JavaScript/TypeScript:** Node.js ecosystem

### ☁️ **Cloud & DevOps**
- AWS CLI
- Google Cloud SDK
- Azure CLI
- Docker Desktop

### 🎨 **Design & Productivity Apps**
- **Design:** Figma, Sketch, Affinity Designer
- **Communication:** Slack, Discord, WhatsApp, Spark
- **Productivity:** Notion, Transmit, The Unarchiver
- **Media:** VLC, Spotify, Dropbox

### 🔧 **Development Applications**
- **Browsers:** Firefox, Google Chrome, Arc
- **IDEs:** Visual Studio Code, Warp (terminal)
- **API Tools:** Postman, Insomnia
- **Database Tools:** Sequel Pro
- **Version Control:** GitHub Desktop

### 🔍 **Quick Look Helpers**
- qlcolorcode, qlstephen, qlmarkdown
- quicklook-json, quicklook-csv
- qlprettypatch, betterzipql
- qlimagesize, webpquicklook
- suspicious-package

### ⚙️ **System Optimizations**
- Save to disk (not to iCloud) by default
- Disable press-and-hold for keys in favor of key repeat
- Blazingly fast keyboard repeat rate
- Enable subpixel font smoothing
- Show all filename extensions in Finder
- Disable application quarantine warnings
- Dock auto-hide optimizations

---

## 📋 System Requirements

- **Operating System:** macOS (tested on El Capitan and newer)
- **Privileges:** Administrator access required for system-level changes
- **Internet Connection:** Required for downloading packages and applications
- **Storage:** ~5-10GB free space recommended

---

## ⏱️ Installation Time

- **Typical Duration:** 15-30 minutes (depending on internet connection)

*Perfect time to grab a coffee! ☕*

---

## 🔐 Permissions

**Root password will be required for:**
- Apache configuration changes
- System-level package installations
- macOS defaults modifications
- Homebrew and system directory operations

---

## 🆕 What's New in Talus Setup Script

The comprehensive `setup.sh` includes all features from the original scripts plus:

### Enhanced Application Support
- **Design Tools:** Figma, Sketch, Affinity Designer
- **Modern Development:** Docker Desktop, GitHub Desktop, Warp terminal
- **API Development:** Postman, Insomnia for API testing
- **Cloud Platforms:** Complete AWS, GCP, Azure CLI integration

### Advanced Programming Environments
- **Python Ecosystem:** Complete data science and web development stack
- **Go Development:** Modern tooling with linters and hot-reload
- **Rust Setup:** Full cargo environment with package management
- **Multi-Package Management:** pip, pipenv, poetry, npm, yarn, pnpm

### System Enhancements
- **Performance Monitoring:** Advanced terminal tools and benchmarking
- **File Operations:** Modern replacements for standard Unix tools
- **Development Workflows:** Git extras, GitHub integration, cloud deployment

---

## 🤖 Why Talus?

> Talus, an "iron man" who mechanically helps Arthegall dispense justice in The Faerie Queene, the epic poem by Edmund Spenser published in 1590

[Wikipedia - Fictional Robots and Androids](https://en.wikipedia.org/wiki/List_of_fictional_robots_and_androids)

Just like the legendary iron man Talus, this script acts as your mechanical assistant, tirelessly setting up your development environment so you can focus on what matters most: creating amazing software.

---

## 🏆 Credits

The script is based on and inspired by:

* [bootstrap-osx-devel-enviroment](https://github.com/carlosveloso/bootstrap-osx-devel-enviroment)
* [Hacker's Guide to Setting up Your Mac](https://github.com/lapwinglabs/blog/blob/master/hacker-guide-to-setting-up-your-mac.md)
* [OSX for Hackers: Yosemite/Mavericks Edition](https://gist.github.com/brandonb927/3195465)
* Robot character by [RoboHash](https://robohash.org/)

---

## 📝 License

This project is open source and available under the MIT License.
