# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

PATH="/usr/local/bin:/opt/homebrew/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias build="docker-compose build"
alias down="docker-compose down"
alias up="docker-compose up -d"
alias k="kubectl"
alias e="TERM=xterm-256color emacs -nw"
alias notebook="python3 -m notebook"
alias sz="source ~/.zshrc"
alias p="python"
alias pt="python -m pytest -sv"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/nick/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

export PATH="/opt/homebrew/Cellar/:$PATH"
export RUBY_PATH=/opt/homebrew/opt/ruby/bin
export PATH="$RUBY_PATH:$PATH"
export GEM_PATH=/opt/homebrew/lib/ruby/gems/3.2.0/bin
export PATH="$GEM_PATH:$PATH"
export GEM_USER_PATH=/Users/nick/.gem/ruby/3.2.0/bin
export PATH="$GEM_USER_PATH:$PATH"
export PYTHON_PATH=/opt/homebrew/lib/python3.11/site-packages
export PATH="$PYTHON_PATH:$PATH"

export TEX_PATH=/Library/TeX/texbin
export PATH="$TEX_PATH:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export SHELL=/opt/homebrew/bin/fish
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
