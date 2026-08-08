#!/usr/bin/env bash
#
# fuzzy_tmux_sessions
# Fuzzy-pick a tmux session to switch/attach to, or create one by name.
#
# Usage:
#   fuzzy_tmux_sessions           # fuzzy-pick from existing sessions
#   fuzzy_tmux_sessions myproj    # switch/attach to "myproj", creating it if needed
#   fuzzy_tmux_sessions -ask      # prompt for a session name, then switch/attach/create

set -euo pipefail

TMUX_CONF="${TMUX_CONF:-$HOME/.tmux/tmux.conf}"

# Inside tmux -> switch-client, outside tmux -> attach-session
if [[ -n "${TMUX:-}" ]]; then
    change="switch-client"
else
    change="attach-session"
fi

# --- Case 1: a session name (or -ask) was passed as an argument ---
if [[ -n "${1:-}" ]]; then
    if [[ "$1" == "-ask" ]]; then
        read -r -p "New tmux session name: " session_name
    else
        session_name="$1"
    fi

    if [[ -z "$session_name" ]]; then
        echo "No session name given." >&2
        exit 1
    fi

    if tmux "$change" -t "$session_name" 2>/dev/null; then
        exit 0
    else
        tmux -f "$TMUX_CONF" new-session -d -s "$session_name"
        tmux "$change" -t "$session_name"
    fi
    exit 0
fi

# --- Case 2: no argument -> fuzzy pick from existing sessions ---
session=$(tmux list-sessions -F '#{session_name}' 2>/dev/null | \
    fzf --reverse --header 'Select tmux session')

if [[ -z "$session" ]]; then
    exit 0
fi

tmux "$change" -t "$session" || echo "No sessions found." >&2
