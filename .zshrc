ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"


autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
autoload -Uz compinit && compinit

CONFIG="$HOME/.config"
PURE_PROMPT_SYMBOL=">"
PURE_PROMPT_VICMD_SYMBOL="<"

# zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit ice depth=1; zinit light jeffreytse/zsh-vi-mode
zinit light Aloxaf/fzf-tab

# zinit snippet OMZP::git
# zinit snippet OMZP::aws

zinit ice pick"async.zsh" src"pure.zsh"
zinit light sindresorhus/pure

# zinit light spaceship-prompt/spaceship-prompt

# zsh-fzf-history-search
zinit ice lucid wait'0'
zinit light joshskidmore/zsh-fzf-history-search

zinit cdreplay -q


# Import Conda
# source $CONFIG/zsh/conda.zsh
source $CONFIG/zsh/path.zsh
source $CONFIG/zsh/aliases.zsh
source $CONFIG/zsh/misc.zsh
source $CONFIG/zsh/env.zsh
source ~/.secrets.zsh

autoload -Uz promptinit && promptinit

bindkey "^[[B" history-search-forward               # down arrow
bindkey "^[[A" history-search-backward              # up arrow

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

zstyle ':completion:*:complete:make:*:' tag-order 'targets variables'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':prompt:pure:prompt:*' color green
zstyle ':prompt:pure:git:branch' color cyan
zstyle ':prompt:pure:git:dirty' color red

eval "$(fzf --zsh)"
export PATH=/opt/homebrew/bin:/opt/homebrew/bin:/opt/homebrew/opt/trash-cli/bin:/Users/tywr/.local/share/zinit/polaris/bin:/Users/tywr/.cargo/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/TeX/texbin:/Users/tywr/.local/share/zinit/polaris/bin:/Users/tywr/.cargo/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/TeX/texbin:/Users/tywr/.local/share/zinit/polaris/bin:/Users/tywr/.cargo/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/TeX/texbin:/Users/tywr/.local/share/zinit/polaris/bin:/Users/tywr/.cargo/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
