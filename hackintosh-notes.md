credit to https://gist.github.com/kevinelliott/e12aa642a8388baf2499

# notes from Oct 2017 and beyond

* fix copy/paste issue - https://github.com/tmux/tmux/issues/543
  * upgrade tmux to 2.6 or greater
  * tmux.conf
    * `setw -g mode-keys vi`
    * `bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "pbcopy"`
    * `bind-key -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel "pbcopy"`
  * vimrc (for neovim)
    * `set clipboard=unnamed`
# CLEANUP START

## Windows 10 (separate drive)
### Installing Win 10
* create EIFI install usb (r...something)
* BIOS - change boot mode to legacy AND EIFI
* format win 10 with Mac Disk Utility (mac journaled, GUID)
* during win 10 install delete 2 non-EIFI partitions and install on it

### Troubleshooting
* make sure drive order attached to cables is correct. PNY (Win 10) then OCZ (Mac OSX)
* BIOS - put Mac boots as first 2, then EUFI Win boot after
* BIOS boot mode to legacy and EIFI
* only win 10 boots and mac/clover never shows up?
  * disconnect win 10 disk, boot to mac, then connect win 10 disk again
* windows updates mess up booting?
  * disconnect mac disk to boot into win 10
  * bios makes win 10 primary boot disk - this is ok
  * to get into mac osx hit f12 and pick "EUFI OS"

----------------------

* disable accent chars `defaults write -g ApplePressAndHoldEnabled -bool false`

* install iterm beta (2.9+)
* install patched font
  * https://github.com/powerline/fonts/tree/master/Inconsolata-g
  * `cd ~/Library/Fonts && curl -fLo "Inconsolata-g for Powerline.otf" https://raw.githubusercontent.com/powerline/fonts/master/Inconsolata-g/Inconsolata-g%20for%20Powerline.otf`
  * set the font in Preferences -> Profiles -> Text
* install tmux with 24bit color support
  * `brew uninstall tmux`
  * `brew install https://raw.githubusercontent.com/choppsv1/homebrew-term24/master/tmux.rb`

* brew install phantomjs

* fix readline issue in pry - prevents history between pry sessions
  * `gem 'rb-readline'`
  * more info/options - https://github.com/guard/guard/wiki/Add-Readline-support-to-Ruby-on-Mac-OS-X

## Propane.pro project
```
# install qt for capybara webkit
brew install qt

# install v8 in this order
gem uninstall libv8
brew install v8
gem install therubyracer
gem install libv8 -v '3.16.14.3' -- --with-system-v8
```

```
# install redis
brew install redis
# To have launchd start redis at login:
  ln -sfv /usr/local/opt/redis/*.plist ~/Library/LaunchAgents
# Then to load redis now:
  launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist
# test redis is running
  redis-cli ping
```


* use prezto (for zsh)
* install nvim
* dotconfig
  * `cd ~; git clone git@github.com:daniely/dotfiles.git`
  * symlink .vimrc, .tmux.conf, .gitconfig
* zsh config files (.zshenv, .zshrc, etc) need to be setup in prezto's folders
  * `cd ~; git clone git@github.com:daniely/prezto.git`

## setup nvim
* install patched font to max OSX (INSTR)
* install vim-plug...then after installing run... (INSTR)
  * `nvim`
  * `:PlugInstall` # installs vim plugins


# CLEANUP END


# Install

## Apps

* Spotify
* Divvy

# Git/Github

```bash
ssh-keygen -t rsa -C "daniel.kiros@gmail.com"

# Copy ssh key to github.com
cat ~/.ssh/id_rsa.pub | pbcopy

# Test connection
ssh -T git@github.com

# Set git config values
git config --global user.name "Daniel Yoon"
git config --global user.email "daniel.kiros+git_config@gmail.com"
git config --global github.user kevinelliott # ???
git config --global github.token your_token_here # ???

got config --global core.editor=/usr/local/bin/vim
git config --global color.ui true

# global gitignore
ln -s ~/dotfiles/gitignore ~/.gitignore
git config --global core.excludesfile ~/.gitignore
```

#### Dropbox

#### iTerm2

```bash
Preferences > General > Load preferences from a custom folder
# ~/Dropbox/Dev Machine/iterm2_profile
```

#### zsh / prezto ???

modules - git

## Keyboard shortcuts / Aliases

* git
* be = bundle exec

## Utils

* Alfred
* Steam :)
* JetBrains DataGrip
* TheUnarchiver
* atMonitor - Display cpu load, cpu temp, network

#### Seil

```bash
# Mac OSX - unbind caps lock
Keyboard preferences > Modifier Keys > Caps Lock > No Action
```

## My Preferences

copy dotfiles from github and symlink

```bash
# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 0.02

# Set a shorter Delay until key repeat
defaults write NSGlobalDomain InitialKeyRepeat -int 12

# Store screenshots in subfolder on desktop
mkdir ~/Desktop/Screenshots
defaults write com.apple.screencapture location ~/Desktop/Screenshots
killall SystemUIServer
```

### Dev environment

* Postgres App

#### Ruby/Rails

* `gem install pg`
  * `gem install pg -- --with-pg-config='/Applications/Postgres.app/Contents/Versions/latest/bin/pg_config'`
  * need to add Postgress app’s path to $PATH
* `gem install puma -v ‘2.11.2’ -- --with-cppflags=-I/usr/local/opt/openssl/include --with-ldflags=-L/usr/local/opt/openssl/lib`

## Issues

* Sound dies after waking up from sleep
  * change multibeast system config from 3,1 to 14,2
  * change sound preferences to use "headphones"
* usb 3.0 - change multibeast setting to use usb 3.0

## Need to fix
* front panel usb 3.0 not working - unplug it
* deep sleep sometimes reboots - tried disabling front panel usb but still not working right
