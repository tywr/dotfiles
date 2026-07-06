#!/bin/bash
# container-compose-build: docker-compose build, but with Apple's native `container`.
# Tags the image as the service name and forwards --build-arg. Usage:
#   container-compose-build [-f compose.yml] SERVICE [--build-arg K=V ...]
set -euo pipefail

file="docker-compose.yml"
if [[ "${1:-}" == "-f" ]]; then file="$2"; shift 2; fi
[[ -f "$file" ]] || { echo "compose file not found: $file" >&2; exit 1; }

service="${1:?usage: container-compose-build [-f file] SERVICE [--build-arg K=V ...]}"; shift

base="$(cd "$(dirname "$file")" && pwd)"
yq -e ".services.\"$service\"" "$file" >/dev/null 2>&1 || { echo "no service '$service' in $file" >&2; exit 1; }

# build: can be a string (context) or a map {context, dockerfile, args}
if [[ "$(yq -r ".services.\"$service\".build | tag" "$file")" == "!!map" ]]; then
  context="$(yq -r ".services.\"$service\".build.context // \".\"" "$file")"
  dockerfile="$(yq -r ".services.\"$service\".build.dockerfile // \"\"" "$file")"
else
  context="$(yq -r ".services.\"$service\".build // \".\"" "$file")"
  dockerfile=""
fi
if [[ "$context" == "." ]]; then context="$base"
elif [[ "$context" != /* ]]; then context="$base/$context"; fi

args=(-t "$service")

# dockerfile is relative to the build context unless given as an absolute path
if [[ -n "$dockerfile" ]]; then
  [[ "$dockerfile" == /* ]] || dockerfile="$dockerfile"
  args+=(-f "$dockerfile")
fi

# compose build.args -> --build-arg (supports both list `- K=V` and map `K: V` syntax)
if [[ "$(yq -r ".services.\"$service\".build.args | tag" "$file")" == "!!map" ]]; then
  argq=".services.\"$service\".build.args | to_entries | .[] | \"\(.key)=\(.value)\""
else
  argq=".services.\"$service\".build.args[]?"
fi
while IFS= read -r a; do
  [[ -z "$a" ]] && continue
  args+=(--build-arg "$a")
done < <(yq -r "$argq" "$file")

set -x
container build "${args[@]}" "$@" "$context"
