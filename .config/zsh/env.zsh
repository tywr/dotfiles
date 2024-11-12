# Fix some bugs with Python
export LANG=en_US.UTF-8
export LC_ALL="en_US.UTF-8"

export EDITOR=nvim
export VISUAL="$EDITOR"
export FZF_DEFAULT_OPTS="-e \
    --color 16,fg:7,bg:-1,hl:1:bold,hl+:1:bold,bg+:0,fg+:7:regular \
    --color prompt:7,pointer:6,marker:6,spinner:1,info:1 \
    --bind 'tab:toggle-down,btab:toggle-up' \
    --border='bold'"
