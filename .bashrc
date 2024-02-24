[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias code='codium'
alias cls='clear'
alias vi='nvim'
alias vim='nvim'
alias fuckoff='shutdown -P now'
alias swayconf='vim ~/.config/sway/config'
alias waybarconf='vim ~/.config/waybar/config'
alias waybarconf-st='vim ~/.config/waybar/style.css'
alias hyprconf='vim ~/.config/hypr/hyprland.conf'
alias footconf='vim ~/.config/foot/foot.ini'
alias fuzzelconf='vim ~/.config/fuzzel/fuzzel.ini'
alias gtkconf='vim ~/.config/gtk-3.0/settings.ini'

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;33m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
