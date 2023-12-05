export PATH="/opt/homebrew/bin:$PATH"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Aliases
alias i='ionic'
alias sr='ionic serve'
alias ov="vim ~/.vimrc"
alias sv="source ~/.vimrc"
alias oz="vim ~/.zshrc"
alias sz="source ~/.zshrc"
alias ot="vim ~/.tmux.conf"
alias st="tmux source-file ~/.tmux.conf"
alias tns="tmux new -s"
#alias t='tmux attach || tmux new-session\; new-window\; new-window'
alias t='tmux attach || tmux new-session\; split-window -h'
alias tls="tmux list-sessions"
alias tas="tmux attach-session -t"
alias tds="tmux detach"
alias tks="tmux kill-session -t"
alias dx-geocode="cd ~/dev/h/dx-geocode-gql && vim"
alias dx-shop="cd ~/dev/h/dx-shop-gql && vim"
alias dx-hotels="cd ~/dev/h/dx-hotels-gql && vim"
alias dx-etl="cd ~/dev/h/dx-etl-cp && vim"
alias dx-autocomplete="cd ~/dev/h/dx-autocomplete-api && vim"
alias dx-lookups="cd ~/dev/h/dx-lookups-gql && vim"
alias dx-shared-schema="cd ~/dev/h/dx-shared-schema && vim"
alias dx-shared-cp="cd ~/dev/h/dx-shared-cp && vim"
alias ti-dtos="cd ~/dev/ti/lib-dtos-ts && vim"
alias ti-core="cd ~/dev/ti/lib-core-ts && vim"
alias ti-orders="cd ~/dev/ti/serv-order-features && vim"
alias vim="nvim"

export NODE_VERSION=16.7.0
export CF_ENVIRONMENT=LOCAL
export GCP_PROJECT=va-staging

export ZSH="/Users/desoukya/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting web-search)
source $ZSH/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# C/C++ environment variables
export LD_LIBRARY_PATH=/usr/lib

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/desoukya/.nvm/versions/node/v10.16.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/desoukya/.nvm/versions/node/v10.16.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/desoukya/.nvm/versions/node/v10.16.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/desoukya/.nvm/versions/node/v10.16.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/desoukya/.nvm/versions/node/v10.16.0/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/desoukya/.nvm/versions/node/v10.16.0/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/desoukya/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/desoukya/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/desoukya/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/desoukya/google-cloud-sdk/completion.zsh.inc'; fi
# source ~/dev/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"

# Ignore node_module fzf
# export FZF_DEFAULT_COMMAND='ag --nocolor --ignore node_modules -g ""'
if type rg &> /dev/null; then
  # export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_COMMAND='ag --nocolor --ignore e2e/* -g ""'
  export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}
