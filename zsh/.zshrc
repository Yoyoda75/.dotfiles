# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.dotfiles/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $ZDOTDIR/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.dotfiles/zsh/.p10k.zsh.
[[ ! -f ~/.dotfiles/zsh/.p10k.zsh ]] || source ~/.dotfiles/zsh/.p10k.zsh

# Aliases
alias vim="nvim"
alias ls="ls --color=auto"
alias zshreload="source $ZDOTDIR/.zshrc && echo 'sourced .zshrc'"
alias python="python3"
alias pip="pip3"

# Exports
export DOTFILES="$HOME/.dotfiles"
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
