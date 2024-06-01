# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
autoload -U compinit; compinit

if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

zinit ice depth=1; zinit light romkatv/powerlevel10k

#zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

zinit snippet OMZP::git
zinit cdreplay -q


bindkey '^[[A' history-search-backward 
bindkey '^[[B' history-search-forward 

HISTSIZE=6000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

unsetopt BEEP
alias vimconf="cd ~/.config/nvim && nvim ."
alias runapi="cd ~/Documentos/minty/myplazze_api && npm run dev"
alias runmain="cd ~/Documentos/minty/myplazze_main && npm run dev"
alias runcode="cd ~/Documentos/minty && nvim ."
alias vim="nvim"
alias ls='ls --color'
alias dd='nvim /var/tmp/laradump.json'
alias daily='nvim ~/Documentos/minty-daily.md'
alias config="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

source /usr/share/nvm/init-nvm.sh


PATH=~/.console-ninja/.bin:$PATH
