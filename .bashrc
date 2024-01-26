[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias vi="nvim"
alias grep='grep --color=auto'
alias code='codium'
alias cls='clear'
alias swayconf='vi ~/.config/sway/config'
alias waybarconf='vi ~/.config/waybar/config'
alias waybarconf-st='vi ~/.config/waybar/style.css'

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;33m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
