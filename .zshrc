ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
CONFIG="$HOME/.config"
PURE_PROMPT_SYMBOL=">"
PURE_PROMPT_VICMD_SYMBOL="<"

if [[ -r "$ZINIT_HOME/zinit.zsh" ]]; then
    source "$ZINIT_HOME/zinit.zsh"

    autoload -Uz _zinit
    (( ${+_comps} )) && _comps[zinit]=_zinit

    # Add third-party completions before initializing the completion system.
    zinit light zsh-users/zsh-completions
    autoload -Uz compinit
    if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
        compinit
    else
        compinit -C
    fi

    zinit ice depth=1
    zinit light jeffreytse/zsh-vi-mode
    zinit light Aloxaf/fzf-tab
    zinit light zsh-users/zsh-autosuggestions

    zinit ice pick"async.zsh" src"pure.zsh"
    zinit light sindresorhus/pure

    # Load nonessential interactive helpers after the first prompt.
    zinit ice lucid wait'0'
    zinit light joshskidmore/zsh-fzf-history-search

    # Syntax highlighting must be loaded after other widget-modifying plugins.
    zinit light zsh-users/zsh-syntax-highlighting

    zinit cdreplay -q
else
    print -u2 "zinit is not installed at $ZINIT_HOME"
fi


source $CONFIG/zsh/aliases.zsh
source $CONFIG/zsh/misc.zsh
source $CONFIG/zsh/env.zsh
source ~/.secrets.zsh

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
export PATH=/opt/homebrew/bin:/opt/homebrew/opt/trash-cli/bin:/Users/tywr/.local/share/zinit/polaris/bin:/Users/tywr/.cargo/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/TeX/texbin

. "$HOME/.local/bin/env"

# bun completions
[ -s "/Users/tywr/.bun/_bun" ] && source "/Users/tywr/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# python
export PATH="/opt/homebrew/opt/python@3.14/libexec/bin:$PATH"
