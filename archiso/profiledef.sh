#!/usr/bin/env bash
# profiledef.sh for Beru OS Live Media

iso_name="beru-os"
iso_label="BERU_$(date +%Y%m)"
iso_publisher="Beru OS Project <https://github.com/gowdaman-dev/beru-os>"
iso_application="Beru OS - Autonomous AI-Native Wayland Desktop Operating System"
iso_version="$(date +%Y.%m.%d)"
install_dir="beru"
buildmodes=('iso')
bootmodes=('uefi.systemd-boot')
arch="x86_64"
pacman_conf="pacman.conf"
airootfs_image_type="squashfs"
airootfs_image_tool_options=('-comp' 'zstd' '-Xcompression-level' '15' '-b' '1M')
file_permissions=(
  ["/etc/shadow"]="0:0:400"
  ["/etc/gshadow"]="0:0:400"
  ["/root"]="0:0:700"
  ["/root/.automated_script.sh"]="0:0:755"
  ["/usr/local/bin/choose-mirror"]="0:0:755"
  ["/usr/local/bin/Installation_guide"]="0:0:755"
  ["/usr/local/bin/livecd-sound"]="0:0:755"
  ["/usr/bin/beru"]="0:0:755"
  ["/usr/bin/omarchy"]="0:0:755"
)
