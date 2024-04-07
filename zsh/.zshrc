neofetch
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Created by newuser for 5.9

export EDITOR=nvim
source ~/powerlevel10k/powerlevel10k.zsh-theme
ZSH_THEME='powerlevel10k/powerlevel10k'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

### PATH VARIABLES ###
ANTIGEN_PATH="$HOME/.config/antigen.zsh"
HISTFILE="$HOME/.zsh_history"
EDITOR=nvim
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

### DOWNLOAD ANGIGEN ###
if [ ! -f $ANTIGEN_PATH ]; then
    echo "Antigen is not found!" >&2
		
	# Если antigen не скачан, то качаем его
	curl -L git.io/antigen > $ANTIGEN_PATH
fi

source $ANTIGEN_PATH

# antigen bundle autojump
# antigen bundle git
# antigen bundle zsh-users/zsh-syntax-highlighting
# antigen bundle zsh-users/zsh-autosuggestions
# antigen theme 'romkatv/powerlevel10k'

# antigen apply

### ALIAS ###
alias l='eza -alh'
alias cl='clear'
alias v='~/Downloads/neovide.AppImage'
alias open='xdg-open'
alias zshcfg='v .zshrc'
