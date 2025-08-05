source $HOME/Code/antigen.zsh || curl -L git.io/antigen > $HOME/Code/antigen.zsh


antigen use oh-my-zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Kubectl plugin
antigen bundle superbrothers/zsh-kubectl-prompt

# Load the theme.
antigen theme robbyrussell
#antigen theme denysdovhan/spaceship-prompt

# Tell Antigen that you're done.
antigen apply

# To use homebrew installed stuff
export PATH="/opt/homebrew/opt:$PATH"

# To use homebrew installed python
export PATH="/opt/homebrew/opt/python/libexec/bin:$PATH"

# To use homebrew installed vim
export PATH="/opt/homebrew/opt/vim/bin:$PATH"

alias k='kubectl'
alias ag='ag -u'
alias debug='~/Code/debug.sh'
alias oplogs='k logs -n as-air-cluster-system -l control-plane=controller-manager'
alias awslogin='source ~/aws-config.sh'
export PATH=$PATH:~/go/bin

autoload -U colors; colors
function right_prompt() {
  local color="red"

  if [[ "$ZSH_KUBECTL_CONTEXT" =~ kind ]]; then
    color=green
  fi

  echo "%{$fg[$color]%}($ZSH_KUBECTL_PROMPT)%{$reset_color%}"
}

export PATH="/opt/homebrew/opt/go@1.24/bin:$PATH"

export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools
source ~/zsh_secrets
