function topdf {
    pandoc \
            $1 \
            -f gfm \
            -o $1.pdf \
            -V geometry:margin=2cm \
            -V mainfont="TeX Gyre Pagella" \
            -V monofont="KlartextMono Nerd Font" \
            -V sansfont="QTFuture" \
            --pdf-engine=xelatex
}

function ghssh() {
    type_=$1
    echo "Switching to gh-${type_}"
    ssh-add -D
    ssh-add ~/.ssh/gh-${type_}
}

__tmux_fzf_get_session__() {
    session=$(tmux list-sessions -F "#{session_name}" | fzf --exit-0 --reverse --bind 'tab:toggle-down,btab:toggle-up' --border='rounded' --margin='20%' --tmux )
    echo "$session"
}

fuzzy_tmux_sessions() {
    [[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
    if [[ -n "$1" ]]; then
        if [[ "$1" == "-ask" ]]; then
            read -r -p "New tmux session name: " session_name
        else
            session_name="$1"
        fi
        tmux $change -t "$session_name" 2>/dev/null || \
            (tmux -f "$HOME/.tmux/tmux.conf" new-session -d -s "$session_name" && \
            tmux $change -t "$session_name");
        return
    fi
    session=$(eval __tmux_fzf_get_session__)
    if [[ -z "$session" ]]; then
        return
    else
        tmux $change -t "$session" || echo "No sessions found."
    fi
}


function bo {
    bash ~/.config/colorthemes/borders/$1.sh
}

sso::login () {
    local profile=${1}
    echo "Logging into $profile"
    aws sso login --profile $profile && export AWS_PROFILE=$profile
}

aws::export () {
    export AWS_ACCESS_KEY_ID=$(aws configure get aws_access_key_id --profile default)
export AWS_SECRET_ACCESS_KEY=$(aws configure get aws_secret_access_key --profile default)
export AWS_SESSION_TOKEN=$(aws configure get aws_session_token --profile default)
export AWS_DEFAULT_REGION=$(aws configure get region --profile default)
}
