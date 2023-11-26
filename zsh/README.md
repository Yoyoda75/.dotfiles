# Moving all zsh files away from $HOME

Let's say you want to use ~/.dotfiles/zsh as your home.

* First, set the ZDOTDIR variable: export ZDOTDIR=~/.dotfiles/zsh

* Next, make sure ZDOTDIR exists with this command: mkdir -p $ZDOTDIR

* Then, move the following files and directories: mv ~/.zsh* $ZDOTDIR; mv ~/.zlogin $ZDOTDIR

* You can move .oh-my-zsh too (mv ~/.oh-my-zsh $ZDOTDIR), but you need to change your .zshrc to set your ZSH variable to the new location ZSH=$ZDOTDIR/.oh-my-zsh

* While you're editing your .zshrc, set your new history file location AFTER your source Oh-My-Zsh: HISTFILE=$ZDOTDIR/.zsh_history

* Now, here's the important part. You need to have one file, .zshenv, in your home directory to set your ZDOTDIR for future sessions. That file should have one line:
` export ZDOTDIR=~/.config/zsh; [ -f $ZDOTDIR/.zshenv ] && . $ZDOTDIR/.zshenv `

*(Source : https://www.reddit.com/r/zsh/comments/wycqlq/move_config_files_away_from_home/)*

