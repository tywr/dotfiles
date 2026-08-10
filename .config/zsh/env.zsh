# Fix some bugs with Python
export LANG=en_US.UTF-8
export LC_ALL="en_US.UTF-8"
export XDG_CONFIG_HOME="$HOME/.config"

export EDITOR=nvim
export VISUAL="$EDITOR"
export FZF_DEFAULT_OPTS="-e \
    --color fg:248,bg:-1,hl:6 \
    --color fg+:7:regular,hl+:2:bold,bg+:0 \
    --color prompt:15,pointer:6,marker:6,spinner:5,info:2,header:2,border:8 \
    --bind 'tab:toggle-down,btab:toggle-up' \
    --border rounded"

export ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BLOCK
export ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BEAM

export INTRA_LDAP_NAME=tanguy.vivier

export CONTAINER_BUILD_COMMAND="~/.config/zsh/scripts/container-compose-build"
export CONTAINER_RUN_COMMAND="~/.config/zsh/scripts/container-compose-run"
