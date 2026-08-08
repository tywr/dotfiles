# ============================================================================
#                               Aliases
# ============================================================================
alias v="nvim"
alias vim="nvim"
alias vi="nvim"
alias cat="bat --theme ansi --style plain"
alias ls="eza"
alias oldvim="vim"
export EDITOR=nvim
alias lg="lazygit"
alias r="yazi"
alias ra="yazi"
alias ecr42="aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 041667147252.dkr.ecr.us-east-1.amazonaws.com"
alias P="cd ~/Projects/"
alias p="cd ~/Projects/"
alias drun="~/.config/zsh/scripts/container-compose-run"
alias dbuild="~/.config/zsh/scripts/container-compose-build"
alias ghconfig="v ~/.ssh/config"
alias tmux="tmux -2"
alias ts="fuzzy_tmux_sessions"
alias tk="tmux kill-window"
alias tls="tmux list-sessions"
alias tks="tmux kill-session -t"
alias tas="tmux attach-session -t"
alias ta="tmux attach-session -t"
tn() { tmux new -s "${1:-${PWD:t}}"; }
alias nvimpython="~/.python/nvim/bin/python"
alias ..="cd .."
ctags=/usr/local/bin/ctags
