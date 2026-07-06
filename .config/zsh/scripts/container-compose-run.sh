#!/bin/bash
# container-compose-run: docker-compose run, but with Apple's native `container`.
# For now only volume mappings are translated. Usage:
#   container-compose-run [-f compose.yml] SERVICE [CMD...]
set -euo pipefail

file="docker-compose.yml"
if [[ "${1:-}" == "-f" ]]; then file="$2"; shift 2; fi
[[ -f "$file" ]] || { echo "compose file not found: $file" >&2; exit 1; }

service="${1:?usage: container-compose-run [-f file] SERVICE [CMD...]}"; shift

base="$(cd "$(dirname "$file")" && pwd)"

yq -e ".services.\"$service\"" "$file" >/dev/null 2>&1 || { echo "no service '$service' in $file" >&2; exit 1; }
image="$service"

# Translate compose short-syntax volumes to -v flags.
# Relative host paths resolve against the compose file dir (docker-compose behaviour).
args=()
while IFS= read -r vol; do
  [[ -z "$vol" ]] && continue
  host="${vol%%:*}"
  rest="${vol#*:}"
  case "$host" in
    .*|/*|~*) [[ "$host" == /* ]] || host="$base/$host"; vol="$host:$rest" ;;
    # ponytail: named volumes pass through as-is; add real named-volume support if needed
  esac
  args+=(-v "$vol")
done < <(yq -r ".services.\"$service\".volumes[]? " "$file")

set -x
container run --rm -it "${args[@]}" "$image" "$@"
