# Talus

Talus is a `bash` script to automate download & setup your Mac OS X development environment. The idea is to automate the tedious work of setting up a brand new Mac or start a fresh install of a recent formatted one, with special care of web development tools and configurations.

![Talus Robot](https://robohash.org/talus)


### _Talus_ base installs
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
- `nvm`


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

- `iterm2`
- `atom`
- `sublime-text`
- `macdown`
- `firefox`
- `google-chrome`
- `opera`
- `virtualbox`
- `github-desktop`
- `hyperterm`


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
- `Webpack`
- `Express`
- `docker`
- `m-cli`
- `react-li`
- `angular-cli`
- `ember-cli`
- `yeoman (yo)`

## Use

**Open _terminal.app_ and clone this repo:**

```
$ git clone https://github.com/juanbrujo/Talus.git && cd Talus
```

**Make the files executable (they already should be, but just in case):**

```
$ chmod a+x start.sh && chmod a+x webdev.sh
```

**Run each or both of them:**

```
$ ./start.sh
```

```
$ ./webdev.sh
```

--

Go get a cold beer or take a nap. You'll have at least 15 minutes of setup and files being downloaded (depending of your internet connection).

**Maybe you'll be prompted for root password.**

--

### BETA

I've added a `localhost.sh` to help configure a localhost environment for MacOSX. It is still under watch, it isn't fully tested yet.

### Why _Talus_ ?

> Talus, an "iron man" who mechanically helps Arthegall dispense justice in The Faerie Queene the epic poem by Edmund Spenser published in 1590

[Wikipedia](https://en.wikipedia.org/wiki/List_of_fictional_robots_and_androids)


### Credits
The script is based in:

* [bootstrap-osx-devel-enviroment](https://github.com/carlosveloso/bootstrap-osx-devel-enviroment)
* [Hacker's Guide to Setting up Your Mac](http://lapwinglabs.com/blog/hacker-guide-to-setting-up-your-mac)
* [OSX for Hackers: Yosemite/Mavericks Edition](https://gist.github.com/brandonb927/3195465)
* Robot character by [RoboHash](https://robohash.org/)
