sudo dd status=none of=/etc/beru/boot.conf <<EOF
cmdline=$boot_params
EOF
