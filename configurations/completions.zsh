autoload -Uz compinit && compinit
source "$ZDOTDIR/plugins/zsh-completion-generator/zsh-completion-generator.plugin.zsh"
eval "$(thefuck --alias)"
eval "$(zoxide init zsh)"
eval "$(pmy init)"
export NVM_COMPLETION=true
export NVM_AUTO_USE=true
USEROS=$(uname -s)
if [[ "$USEROS" == 'Linux' ]] && which lsb_release 2>&1 >/dev/null; then
  USEROS=$(lsb_release -is)
fi
export CLICOLOR=true
export ZSH_AUTOSUGGEST_USE_ASYNC=1
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export USEROS=$USEROS
