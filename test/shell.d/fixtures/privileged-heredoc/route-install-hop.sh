tmp=$(mktemp)

cat >"$tmp" <<EOF
#!/bin/bash
exec "$HOME/.local/share/beru/bin/beru-agent" "$@"
EOF

sudo install -m 0755 "$tmp" /usr/local/bin/beru-agent-shim
