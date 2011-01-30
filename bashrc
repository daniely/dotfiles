[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

##
# Your previous /Users/Daniel/.bash_profile file was backed up as /Users/Daniel/.bash_profile.macports-saved_2010-09-01_at_06:28:31
##

# MacPorts Installer addition on 2010-09-01_at_06:28:31: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

# set vi as the command line editor (hit ESC to go into it)
set -o vi

export PATH=/:$PATH
  if [ -f /opt/local/etc/bash_completion ]; then
      . /opt/local/etc/bash_completion
  fi

# bash prompt
#PS1='\[\e[1;33m\]\w \[\e[1;30m\]\u\[\e[0m\]\n$(__git_ps1 "(%s) ")➔ '
# bash prompt with rvm and git status
PS1='\[\e[1;33m\]\w \[\e[1;30m\]\u\[\e[0m\] $(~/.rvm/bin/rvm-prompt)\n$(__git_ps1 "(%s) ")➔ '

# aliases
alias ll='ls -alG'
alias lserver='ps aux | grep ruby'

# create a shortcut to our rails project dir
rd=~/daniely/Programming/Ruby/Rails/Projects/
rw=~/daniely/Programming/Ruby/RubyWarrior
#cd $rd
