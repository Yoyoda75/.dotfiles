# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.dotfiles/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $ZDOTDIR/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.dotfiles/zsh/.p10k.zsh.
[[ ! -f ~/.dotfiles/zsh/.p10k.zsh ]] || source ~/.dotfiles/zsh/.p10k.zsh

# AUTOCOMPLETION
# initialize autocompletion
autoload -U compinit && compinit

# Aliases
alias vim="nvim"
alias ls="ls --color=auto"
alias zshreload="source $ZDOTDIR/.zshrc && echo 'sourced .zshrc'"

# Exports
export DOTFILES="$HOME/.dotfiles"
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# PATH
PATH="/opt/homebrew/bin:$PATH"
PATH="/opt/homebrew/opt/node@20/bin:$PATH"

# history setup
setopt SHARE_HISTORY
HISTFILE=$DOTFILES/zsh/.zsh_history
SAVEHIST=1000
HISTSIZE=999
setopt HIST_EXPIRE_DUPS_FIRST

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
