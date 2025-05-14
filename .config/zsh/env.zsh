# Fix some bugs with Python
export LANG=en_US.UTF-8
export LC_ALL="en_US.UTF-8"

export EDITOR=nvim
export VISUAL="$EDITOR"
export FZF_DEFAULT_OPTS="-e \
    --color fg:7,bg:-1,hl:5:bold \
    --color fg+:15:regular,hl+:5:bold,bg+:0 \
    --color prompt:15,pointer:6,marker:6,spinner:5,info:2,header:2,border:8 \
    --bind 'tab:toggle-down,btab:toggle-up' \
    --border='bold'"
