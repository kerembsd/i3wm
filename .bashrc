# =============================================================================
# ~/.bashrc — Gruvbox teması
# =============================================================================

# Interaktif shell değilse çık
[[ $- != *i* ]] && return

# =============================================================================
# Geçmiş
# =============================================================================
HISTSIZE=10000
HISTFILESIZE=20000
HISTCONTROL=ignoredups:ignorespace
HISTTIMEFORMAT="%d/%m/%y %T "
shopt -s histappend
shopt -s checkwinsize

# =============================================================================
# Renkler — Gruvbox
# =============================================================================
GRV_BG='\[\033[0;30m\]'   # #282828
GRV_FG='\[\033[0;37m\]'   # #ebdbb2
GRV_RED='\[\033[0;31m\]'  # #cc241d
GRV_GRN='\[\033[0;32m\]'  # #98971a
GRV_YLW='\[\033[0;33m\]'  # #d79921
GRV_BLU='\[\033[0;34m\]'  # #458588
GRV_PRP='\[\033[0;35m\]'  # #b16286
GRV_CYN='\[\033[0;36m\]'  # #689d6a
GRV_WHT='\[\033[1;37m\]'  # bright white
GRV_RST='\[\033[0m\]'

# Git branch göster (varsa)
git_branch() {
    git branch 2>/dev/null | grep '^*' | sed 's/* //'
}

# PS1 — kullanıcı@host dizin [branch] $
PS1="${GRV_BLU}\u${GRV_RST}@${GRV_CYN}\h${GRV_RST} ${GRV_YLW}\W${GRV_RST}"
PS1+='$(b=$(git_branch); [ -n "$b" ] && echo " \[\033[0;35m\]($b)\[\033[0m\]")'
PS1+="${GRV_GRN} \$${GRV_RST} "

# =============================================================================
# Aliases
# =============================================================================
# Dosya işlemleri
alias ls='ls --color=auto --group-directories-first'
alias ll='ls -alF --color=auto --group-directories-first'
alias la='ls -A --color=auto'
alias l='ls -CF --color=auto'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias mkdir='mkdir -pv'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Grep renklendirme
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Sistem
alias update='sudo pacman -Syu'
alias install='sudo pacman -S'
alias remove='sudo pacman -Rns'
alias search='pacman -Ss'
alias cleanup='sudo pacman -Rns $(pacman -Qtdq) 2>/dev/null || echo "Temizlenecek paket yok"'
alias df='df -h'
alias du='du -sh'
alias free='free -h'
alias top='htop'
alias ports='ss -tulpn'

# i3 ve X
alias reload-i3='i3-msg reload'
alias restart-i3='i3-msg restart'
alias xres='xrandr --auto'

# Git
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline --graph --decorate'
alias gd='git diff'

# Editör
alias nano='nano --smooth'
alias edit='nano'

# Diğer
alias cls='clear'
alias h='history | tail -20'
alias path='echo $PATH | tr ":" "\n"'
alias myip='curl -s ifconfig.me && echo'
alias weather='curl -s wttr.in'

# =============================================================================
# Otomatik Tamamlama
# =============================================================================
if [[ -f /usr/share/bash-completion/bash_completion ]]; then
    . /usr/share/bash-completion/bash_completion
elif [[ -f /etc/bash_completion ]]; then
    . /etc/bash_completion
fi

# =============================================================================
# Diğer
# =============================================================================
# Renkli man sayfaları
export MANPAGER="less -R --use-color -Dd+r -Du+b"

# Varsayılan editör
export EDITOR=nano
export VISUAL=nano

# ls renkleri
export LS_COLORS='di=34:fi=0:ln=36:pi=33:so=35:bd=33:cd=33:or=31:mi=31:ex=32'
