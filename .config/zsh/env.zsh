# Fix some bugs with Python
export LANG=en_US.UTF-8
export LC_ALL="en_US.UTF-8"

export EDITOR=nvim
export VISUAL="$EDITOR"
export FZF_DEFAULT_OPTS="-e \
    --color 16,fg:7,bg:-1,hl:5:bold,hl+:5:bold,bg+:0,fg+:15:regular \
    --color prompt:7,pointer:6,marker:6,spinner:5,info:2 \
    --bind 'tab:toggle-down,btab:toggle-up' \
    --border='bold'"
