credit to https://gist.github.com/kevinelliott/e12aa642a8388baf2499

# CLEANUP START
* install iterm beta (2.9+)
* install patched font
  * https://github.com/powerline/fonts/tree/master/Inconsolata-g
  * `cd ~/Library/Fonts && curl -fLo "Inconsolata-g for Powerline.otf" https://raw.githubusercontent.com/powerline/fonts/master/Inconsolata-g/Inconsolata-g%20for%20Powerline.otf`
  * set the font in Preferences -> Profiles -> Text

* brew install phantomjs

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
# fix Ctrl+h in neovim through iTerm2 preferences
Edit -> Preferences -> Keys
Press +
Press Ctrl+h as Keyboard Shortcut
Choose Send Escape Sequence as Action
Type [104;5u
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
  * need to add Postgress app’s path to $PATH
* `gem install puma -v ‘2.11.2’ -- --with-cppflags=-I/usr/local/opt/openssl/include --with-ldflags=-L/usr/local/opt/openssl/lib`

## Issues

* Sound dies after waking up from sleep - change multibeast system config from 3,1 to 14,2
* usb 3.0 - change multibeast setting to use usb 3.0
* 

## Need to fix

* usb 3.0 not working
