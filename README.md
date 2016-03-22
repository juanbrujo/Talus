# Talus

Talus is a `bash` script to automate download & setting up your Mac OS X development environment. The idea is to automate the tedious work of setting up a brand new Mac or start a fresh install of a troubled one, with special care of web development tools and configurations.

![Talus Robot](https://dl.dropboxusercontent.com/u/3522/talus.png)


### Talus base installs
- [Homebrew](http://brew.sh/) 
- [Cask](http://caskroom.io/)
- [Oh my zsh](http://ohmyz.sh/)
- tmux, vim
- OS X tools


**Basic packages:**

- `wget`
- `curl`
- `ffmpeg`
- `node`
- `nginx`
- `ruby`
- `mysql`
- `postgre`
- `redis`
- `heroku-toolbelt`


**Common apps (customize if needed):**

- `dropbox`
- `disk-inventory-x`
- `mplayerx`
- `vlc`
- `skype`
- `airmail-amt`
- `transmit`
- `vox`
- `iresize`
- `mou`
- `paparazzi`
- `the-unarchiver`
- `unrarx`
- `miro-video-converter`
- `adium`
- `evernote`
- `torbrowser`
- `transmission`
- `slack`
- `sip`
- `telegram`


**Apps for development:**

- `iterm`
- `atom`
- `sublime-text`
- `macdown`
- `firefox`
- `google-chrome`
- `opera`
- `virtualbox`
- `github-desktop`


**Fixes some OSX annoyances:**

- `Save to disk (not to iCloud) by default`
- `Disable press-and-hold for keys in favor of a key repeat`
- `Fast keyboard repeat rate` 


**Misc:**

- `Link Sublime Text command line`


**Quicklook helpers:** (see [Quicklook plugins](https://github.com/sindresorhus/quick-look-plugins))

- `qlcolorcode`
- `qlstephen`
- `qlmarkdown`
- `quicklook-json`
- `qlprettypatch`
- `quicklook-csv`
- `betterzipql`
- `qlimagesize`
- `webpquicklook`
- `suspicious-package`


In a separate bash script, there's some useful global npm modules:

**Specific npm global modules for webdev:**

- `Gulp`
- `GruntJS`
- `Bower`
- `npm-check-updates`

### Use

**Clone and make the file executable:**

`chmod a+x start.sh`

**Run it:**

`./start.sh`

_Go get a cold beer and take a nap_

_Maybe you'll be prompted for root password_

**Run additional npm global modules:**

`./webdev.sh`


### Why _Talus_ ?

> Talus, an "iron man" who mechanically helps Arthegall dispense justice in The Faerie Queene the epic poem by Edmund Spenser published in 1590

[Wikipedia](https://en.wikipedia.org/wiki/List_of_fictional_robots_and_androids)


### Credits
The script is based in:

* [bootstrap-osx-devel-enviroment](https://github.com/carlosveloso/bootstrap-osx-devel-enviroment)
* [Hacker's Guide to Setting up Your Mac](http://lapwinglabs.com/blog/hacker-guide-to-setting-up-your-mac)
* [OSX for Hackers: Yosemite/Mavericks Edition](https://gist.github.com/brandonb927/3195465)
* Character free by [vectorcharacters.net](http://vectorcharacters.net/)