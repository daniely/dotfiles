# use vi key bindings
bindkey -v

# current git branch
alias curb="git rev-parse --abbrev-ref HEAD"

# completely disable zsh autocorrect
#unsetopt correct_all

# Customize to your needs...
export PATH=$HOME/.rbenv/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/heroku/bin
# for rbenv
eval "$(rbenv init -)"
