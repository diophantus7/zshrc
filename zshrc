# File:				.zshrc
# Purpose:			config file for Z Shell
# Author:			Stefan Schmid <bademeister7@web.de>
# Last modified: " . |echo d

# history
HISTFILE=~/.zsh/zsh_history
HISTSIZE=200
SAVEHIST=500
setopt histignoredups

# alias
alias hist='history -30'
alias -s tex=vi		# open tex-files with vi
alias -s txt=vi		# open txt-files with vi
alias ping='ping -c3'
alias cal='cal -m'
alias ls='ls --color=auto'
alias feh='feh -g 1024x768'
alias axiom='setarch i386 -R axiom'
# source
source ~/.zsh/keybindings

# Vars
export CVSROOT=:extssh:rbg:~/cvs
export LESS="-i"
export GEM_HOME=$HOME/.gems
export GEM_PATH=$HOME/.gems:/usr/lib/ruby/gems/1.8/
export PATH=$PATH:$HOME/.gems/bin

# gen. Options
setopt NO_BEEP		# set system bell off
setopt correct		# correct on mistype

# ignore case on autocomplete with tab
autoload -U compinit
compinit -C
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

# set up the prompt
setopt prompt_subst
PROMPT='[%h]%m:%4c%# '
RPROMPT='%?'

case $xterm in xterm*)
PR_TITLEBAR=$'%{\e]0;%(!.-=*[ROOT]*=- | .)%n@%m:%~ | ${COLUMNS}x${LINES} | %y\a%}'
;;
screen)
PR_TITLEBAR=$'%{\e_screen \005 (\005t) | %(!.-=[ROOT]=- | .)%n@%m:%~ | ${COLUMNS}x${LINES} | %y\e\\%}'
;;
*)
PR_TITLEBAR=''
;;
esac
