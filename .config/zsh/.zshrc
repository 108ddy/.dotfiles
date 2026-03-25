# Enable Powerlevel10k instant prompt.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# load modules
zmodload zsh/complist
autoload -U compinit && compinit
autoload -U colors && colors 
autoload -U tetriscurses


# cmp opts
zstyle ":completion:*" menu select
zstyle ":completion:*" special-dirs true
zstyle ":completion:*" list-colors ${(s.:.)LS_COLORS} ma=0\;33


# main opts
setopt append_history inc_append_history share_history # better history
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt auto_param_slash
setopt no_case_glob no_case_match                      # make cmp case insensitive
setopt glob_dots                                       # include dotfiles
setopt extended_glob                                   # includes all special symbols
setopt interactive_comments
setopt prompt_subst
unsetopt prompt_sp

[[ -t 0 ]] && stty -ixon                               # disable XON/XOFF flow control in shell


# history opts
HISTSIZE=10000
SAVEHIST=10000
HISTFILE="$XDG_CACHE_HOME/.zsh_history"
HISTCONTROL=ignoreboth


# keybinds
## MAIN Keys
bindkey "^a" beginning-of-line
bindkey "^q" beginning-of-line
bindkey "^d" end-of-line
bindkey "^e" end-of-line

bindkey "^w" forward-word
bindkey "^b" backward-word
bindkey "^k" forward-char
bindkey "^j" backward-char

bindkey "^d^d" kill-whole-line
bindkey "^d^w" kill-word
bindkey "^d^b" backward-kill-word
bindkey "^x" kill-char

bindkey "^u" undo

bindkey "^J" history-search-backward
bindkey "^K" history-search-forward

## SPECIAL Keys
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

bindkey "^[[2~" overwrite-mode
bindkey "^H" backward-kill-word
bindkey "^[[3~" delete-char

bindkey "^[[5~" history-beginning-search-backward
bindkey "^[[6~" history-beginning-search-forward
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down


# plugins
# requires zsh-syntax-highlighting,zsh-history-substring-search, zsh-theme-powerlevel10k-git
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme


[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

