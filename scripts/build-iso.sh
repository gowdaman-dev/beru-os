#!/usr/bin/env bash
# scripts/build-iso.sh
# Builds the bootable Beru OS Live ISO image using mkarchiso

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
ARCHISO_PROFILE="$PROJECT_ROOT/archiso"
WORK_DIR="${TMPDIR:-/tmp}/beru-build-work"
OUT_DIR="$PROJECT_ROOT/out"
AIROOTFS="$ARCHISO_PROFILE/airootfs"

echo "=========================================================="
echo "          Beru OS Live ISO Builder"
echo "=========================================================="

# Check requirements
if ! command -v mkarchiso >/dev/null 2>&1; then
  echo "[!] mkarchiso not found. Installing 'archiso' via pacman..."
  if command -v sudo >/dev/null 2>&1; then
    sudo pacman -S --needed --noconfirm archiso
  else
    pacman -S --needed --noconfirm archiso
  fi
fi

# Clean & create directories
mkdir -p "$OUT_DIR"
rm -rf "$WORK_DIR"
mkdir -p "$AIROOTFS/usr/share/beru"
mkdir -p "$AIROOTFS/usr/bin"
mkdir -p "$AIROOTFS/etc/skel"

echo "==> Packaging Beru OS runtime into airootfs..."
rsync -a --delete \
  --exclude='.git' \
  --exclude='.github' \
  --exclude='.codegraph' \
  --exclude='.pi' \
  --exclude='out' \
  --exclude='archiso' \
  "$PROJECT_ROOT/" "$AIROOTFS/usr/share/beru/"

# Symlink binaries into /usr/bin inside airootfs
ln -sf /usr/share/beru/bin/beru "$AIROOTFS/usr/bin/beru"
ln -sf /usr/share/beru/bin/omarchy "$AIROOTFS/usr/bin/omarchy"

# Copy default profile and environment
mkdir -p "$AIROOTFS/etc/profile.d"
cp -f "$PROJECT_ROOT/etc/profile.d/beru.sh" "$AIROOTFS/etc/profile.d/beru.sh" 2>/dev/null || true

echo "==> Building Beru OS ISO via mkarchiso..."
if command -v sudo >/dev/null 2>&1; then
  sudo mkarchiso -v -w "$WORK_DIR" -o "$OUT_DIR" "$ARCHISO_PROFILE"
else
  mkarchiso -v -w "$WORK_DIR" -o "$OUT_DIR" "$ARCHISO_PROFILE"
fi

echo "==> Generating SHA256 Checksums..."
cd "$OUT_DIR"
for iso in beru-os-*.iso; do
  if [[ -f "$iso" ]]; then
    sha256sum "$iso" > "${iso}.sha256"
    echo "    Checksum: $(cat "${iso}.sha256")"
  fi
done

echo "=========================================================="
echo "==> Beru OS ISO build finished successfully!"
echo "    Output files located in: $OUT_DIR"
echo "=========================================================="
