#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOT"

if [[ "${EUID}" -ne 0 ]]; then
  echo "Run this script as root (example: sudo ./build-zanx.sh)" >&2
  exit 1
fi

command -v lb >/dev/null 2>&1 || {
  echo "live-build is required. Install it with: apt install live-build" >&2
  exit 1
}

mkdir -p dist
rm -rf cache .build

echo "[ZanX] Cleaning previous live-build state..."
lb clean --all || true

echo "[ZanX] Configuring Debian 13/Trixie amd64 live image..."

lb config \
  --mode debian \
  --distribution trixie \
  --distribution-chroot trixie \
  --distribution-binary trixie \
  --architectures amd64 \
  --archive-areas "main contrib non-free non-free-firmware" \
  --keyring-packages "debian-archive-keyring" \
  --mirror-bootstrap "https://deb.debian.org/debian/" \
  --mirror-chroot "https://deb.debian.org/debian/" \
  --mirror-chroot-security "https://security.debian.org/debian-security/" \
  --mirror-binary "https://deb.debian.org/debian/" \
  --mirror-binary-security "https://security.debian.org/debian-security/" \
  --binary-images iso-hybrid \
  --bootappend-live "boot=live components quiet splash username=zanx hostname=zanx" \
  --debian-installer live \
  --apt-recommends true \
  --apt-secure true \
  --memtest none \
  --iso-application "ZanX OS" \
  --iso-publisher "ZanX OS Project" \
  --iso-volume "ZANX_OS" \
  --cache true

echo "[ZanX] Building ISO..."

lb build

ISO="$(find . -maxdepth 1 -type f -name '*.iso' -print -quit)"

if [[ -z "${ISO}" ]]; then
  echo "Build finished but no ISO was found." >&2
  exit 1
fi

STAMP="$(date +%Y%m%d-%H%M)"
OUT="dist/ZanX-OS-${STAMP}-amd64.iso"

cp -f "$ISO" "$OUT"

echo ""
echo "=========================================="
echo "       ZANX OS BUILD COMPLETE"
echo "=========================================="
echo ""
echo "[ZanX] ISO ready:"
echo "$OUT"
echo ""
