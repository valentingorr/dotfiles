export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

source $ZSH/oh-my-zsh.sh

ENABLE_CORRECTION="true"
plugins=(
	git
	zsh-navigation-tools
	zsh-interactive-cd
	# zsh-autosuggestions
	sudo
	qrcode
	lol
	jsontools
	history
	dirhistory
	copypath
	copyfile
	command-not-found
)

alias nv=nvim
alias g=git
alias py=python3.11

mkcd() {
	mkdir -p $1 && cd $1
}

fcd() {
	local dir
	dir=$(find ${1:-.} -type d -not -path '*/\.*' 2 /dev/null | fzf +m) && cd "$dir"
}

cdl() {
	cd $d1 && ls
}

extract() {
	if [ -f "$1" ] ; then
		case "$1" in
			*.tar.bz2)   tar xvjf "$1" ;;
			*.tar.gz)    tar xvzf "$1" ;;
			*.bz2)       bunzip2 "$1" ;;
			*.rar)       unrar x "$1" ;;
			*.gz)        gunzip "$1" ;;
			*.tar)       tar xf "$1" ;;
			*.tbz2)      tar xvjf "$1" ;;
			*.tgz)       tar xvzf "$1" ;;
			*.zip)       unzip "$1" ;;
			*.Z)         uncompress "$1" ;;
			*.7z)        7z x "$1" ;;
			*)           echo "Unknown archive format: $1" ;;
		esac
	else
		echo "$1 is not a valid file"
	fi
}

editrc() {
	nvim $HOME/.zshrc
	source $HOME/.zshrc
}

search() {
    grep -rnw "$2" -e "$1"
}

recent() {
    find . -type f -printf '%T@ %p\n' | sort -k 1nr | head -n 10
}

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

tmux
clear
