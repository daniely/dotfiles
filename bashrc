[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

# set vi as the command line editor (hit ESC to go into it)
set -o vi

export PATH=/:$PATH

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi


# bash prompt
#PS1='\[\e[1;33m\]\w \[\e[1;30m\]\u\[\e[0m\]\n$(__git_ps1 "(%s) ")➔ '
# bash prompt with rvm and git status
PS1='\[\e[1;33m\]\w \[\e[1;30m\]\u\[\e[0m\] $(~/.rvm/bin/rvm-prompt)\n$(__git_ps1 "(%s) ")➔ '

# aliases
alias ll='ls -alG'
alias lserver='ps aux | grep ruby'

# create a shortcut to our rails project dir
rd=~/daniely/Programming/Ruby/Rails/Projects
rw=~/daniely/Programming/Ruby/RubyWarrior
s=$rd/Shejiao
f=$rd/Flow1
#cd $rd
