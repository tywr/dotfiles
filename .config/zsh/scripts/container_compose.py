#!/usr/bin/env python
"""Shared helpers and command dispatcher for the container-compose-* scripts.

Translate a docker-compose.yml service into an Apple `container` CLI invocation.
Parsing is delegated to `yq -o=json` so we don't need a YAML lib.
"""
import json
import os
import shlex
import subprocess
import sys


def die(msg):
    print(msg, file=sys.stderr)
    sys.exit(1)


def open_service(file, service_name):
    """Load one service from a compose file. Returns (base, service_dict).

    base = absolute dir of the compose file (compose paths resolve against it).
    """
    if not os.path.isfile(file):
        die(f"compose file not found: {file}")

    out = subprocess.run(["yq", "-o=json", ".", file], capture_output=True, text=True)
    if out.returncode != 0:
        die(f"failed to parse {file}: {out.stderr.strip()}")
    compose = json.loads(out.stdout or "{}")

    service = (compose.get("services") or {}).get(service_name)
    if service is None:
        die(f"no service '{service_name}' in {file}")

    return os.path.dirname(os.path.abspath(file)), service


def load_service(argv, usage):
    """Parse `[-f file] SERVICE [rest...]` -> (base, service_name, service, rest)."""
    file = "docker-compose.yml"
    if argv and argv[0] == "-f":
        if len(argv) < 2:
            die(usage)
        file, argv = argv[1], argv[2:]
    if not argv:
        die(usage)
    service_name, rest = argv[0], argv[1:]
    base, service = open_service(file, service_name)
    return base, service_name, service, rest


def image_tag(service_name):
    """Use the Compose service name as the image tag for every command."""
    return service_name


def resolve(base, path):
    """Resolve a compose-relative path against base. '.' -> base; absolute kept as-is."""
    p = os.path.expanduser(path)
    if os.path.isabs(p):
        return p
    if p == ".":
        return base
    return os.path.normpath(os.path.join(base, p))


def build_args(spec):
    """compose build.args (map or list) -> ['K=V', ...]. None value -> bare 'K'."""
    out = []
    if isinstance(spec, dict):
        for k, v in spec.items():
            out.append(k if v is None else f"{k}={_val(v)}")
    elif isinstance(spec, list):
        out.extend(str(x) for x in spec)
    return out


def publish_specs(ports):
    """compose ports (list of short strings or long dicts) -> ['[host-ip:]host:container[/proto]', ...]."""
    out = []
    for p in ports or []:
        if isinstance(p, dict):  # long syntax
            spec = str(p["published"]) + ":" + str(p["target"])
            if p.get("host_ip"):
                spec = f"{p['host_ip']}:{spec}"
            if p.get("protocol"):
                spec += f"/{p['protocol']}"
            out.append(spec)
        else:  # short syntax passes straight through (e.g. "8080:80", "127.0.0.1:8080:80/tcp")
            out.append(str(p))
    return out


def _val(v):
    if isinstance(v, bool):
        return "true" if v else "false"
    return str(v)


def run(cmd):
    """Echo (like `set -x`) then exec, replacing this process."""
    print("+ " + " ".join(shlex.quote(c) for c in cmd), file=sys.stderr)
    os.execvp(cmd[0], cmd)


def main(argv):
    commands = {"build", "run", "up", "down"}
    if not argv or argv[0] not in commands:
        die("usage: container_compose.py {build|run|up|down} [options]")

    script = os.path.join(os.path.dirname(__file__), f"container-compose-{argv[0]}")
    os.execv(script, [script, *argv[1:]])


if __name__ == "__main__":
    main(sys.argv[1:])
