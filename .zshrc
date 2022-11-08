# Set oh-my-zsh
ZSH_THEME="robbyrussell"

plugins=(
  asdf
  docker
  fd
  fzf
  git
  z
)

# Set brew path
if command -v brew >/dev/null; then
  BREW_PREFIX="$(brew --prefix)"
fi

ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
source $BREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source <(kubectl completion zsh)

# Unset local functions and variables
unset BREW_PREFIX

# Load fzf
if [ -f ~/.fzf.zsh ]; then
  source ~/.fzf.zsh

  # fshow - git commit browser
  fshow() {
    git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(green)%cr%C(reset)" "$@" |
    fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --preview "echo {} | grep -o '[a-f0-9]\{7\}' | head -1 |
                 xargs -I % sh -c 'git show --color=always %'" \
      --bind "ctrl-m:execute:
        (grep -o '[a-f0-9]\{7\}' | head -1 |
        xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
        {}
FZF-EOF"
  }
  export FZF_DEFAULT_COMMAND='fd --type file'
fi

# Aliases
alias ls="exa"
alias ll="exa -alh --git --color=automatic"
alias cat="bat"
alias python="python3"
alias py="python"
alias vim="nvim"
alias vi="nvim"
