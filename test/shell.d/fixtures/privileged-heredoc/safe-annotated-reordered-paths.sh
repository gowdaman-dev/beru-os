storage="$HOME/storage"
shared="$HOME/shared"

# beru:heredoc-expands paths=shared,storage -- both sources are validated before use
cat >/etc/beru/mounts.conf <<EOF
storage=$storage:/storage
shared=$shared:/shared
EOF
