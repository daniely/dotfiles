# use vi key bindings
bindkey -v

# current git branch
alias curb="git rev-parse --abbrev-ref HEAD"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

export EDITOR=vim
# completely disable zsh autocorrect
#unsetopt correct_all

# Customize to your needs...
export PATH=$HOME/.rbenv/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/heroku/bin
# for rbenv
eval "$(rbenv init -)"
