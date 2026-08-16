#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
mkdir -p "$ROOT/dist"

if command -v docker >/dev/null 2>&1; then
  docker build -t zanx-builder -f "$ROOT/docker/Dockerfile" "$ROOT"
  docker run --rm --privileged \
    -v "$ROOT/dist:/workspace/dist" \
    zanx-builder
elif command -v podman >/dev/null 2>&1; then
  podman build -t zanx-builder -f "$ROOT/docker/Dockerfile" "$ROOT"
  podman run --rm --privileged \
    -v "$ROOT/dist:/workspace/dist" \
    zanx-builder
else
  echo "Install Docker or Podman, or use ./build-zanx.sh on a Debian host." >&2
  exit 1
fi
