# bash
alias new-alias="nvim $HOME/.bash_aliases && source $HOME/.bash_aliases"
alias md="mkdir -pv"
alias rm="rm -rv"
alias .="cdi"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias cls="clear"
alias now="date '+%Y-%m-%d %T'"
alias myip="curl ipconfig.io/json | jq '.country_iso+.ip'"
alias ping="ping -c4"
alias df="df -Tha --total"
alias free="free -mtl"
alias ps="ps auxf"
alias psg="ps aux | rg -v rg | rg -ie VSZ -e"
alias mount="mount | column -t"
alias mnt="mount | rg -e ^/dev"

# fd
alias fd="fd . --full-path --no-ignore"
alias open_nvim="fd --type f --hidden --exclude .git | fzf-tmux -p --reverse | xargs tmux new -s project -n code nvim"

# trash-cli
alias del="trash-put"

# eza
alias tree="eza -aTL"
alias l="eza -Ga --group-directories-first --sort type --icons --color=always --classify=always"
alias ll="eza -1lXabhHiUm@ --group-directories-first --git-repos --git --time-style '+%Y%m%d%H%M%S' --smart-group --sort type --icons=always --color=always --classify=always"
alias llt="eza -1lXabhHiUm@T --git-repos --git --time-style '+%Y%m%d%H%M%S' --smart-group --sort type --icons=always --color=always --classify=always -L"

# neovim
alias v="nvim"

# yay
alias pkgI="yay -Slqy | fzf --multi --cycle --layout reverse --prompt 'Packages to install: ' --preview 'yay -Sii {1}' | xargs -ro yay -S --needed"
alias pkgR="yay -Qq | fzf --multi --cycle --layout reverse --prompt 'Packages to uninstall: ' --preview 'yay -Qii {1}' | xargs -ro yay -Rns"
alias pkgL="yay -Qq | fzf --multi --cycle --layout reverse --prompt 'Packages: ' --preview 'yay -Qii {1}'"
alias pkgS="yay -Slqy | fzf --multi --cycle --layout reverse --prompt 'Packages: ' --preview 'yay -Sii {1}'"

# docker
alias docker-rmi="docker rmi \$(docker image ls -aq)"
