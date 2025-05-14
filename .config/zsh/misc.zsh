function sync-config {
    dotfiles=~/Projects/dotfiles
    echo "Dotfiles repo location ${dotfiles}"
    names=(alacritty nvim ranger skhd yabai zsh)
    for name in $names; do
        echo "Copying $name..."
        cp -R ~/.config/$name $dotfiles/.config/$name
    done
    echo "Copying .zshrc"
    cp ~/.zshrc ${dotfiles}/.zshrc
    echo "Copying .tmux.conf"
    cp ~/.tmux.conf ${dotfiles}/.tmux.conf
    echo "Copying lazygit.conf"
    cp ~/Library/Application\ Support/lazygit/config.yml "${dotfiles}/lazygit.config.yml"
}


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

function gh() {
    type_=$1
    echo "Switching to gh-${type_}"
    ssh-add -D
    ssh-add ~/.ssh/gh-${type_}
}

function docker-clean {
    docker container rm $(docker container ls -aq)
}

function git_branch_name()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
      if [ -z "$(git status --porcelain)" ];
      then
        echo '['$branch']'
      else
        echo '['$branch']*'
      fi
  fi
}

function emr-ssh {
    ssh -o StrictHostKeyChecking=no -i ~/.ssh/Hadoop42matters.pem -ND 8157 hadoop@$1
}

__tmux_fzf_get_session__() {
    session=$(tmux list-sessions -F "#{session_name}" | fzf --exit-0 --reverse --bind 'tab:toggle-down,btab:toggle-up' --border='bold' --margin='20%' --tmux )
    echo "$session"
}

# Tmux session switcher (`tms foo` attaches to `foo` if exists, else creates
# it)
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
