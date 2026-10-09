mkdir -p ~/.config/beru

cat >~/.config/beru/agent.conf <<EOF
helper=$HOME/.local/share/beru/bin/beru-agent
EOF

cat >"$HOME/.local/bin/beru-shim" <<EOF
exec "$BERU_PATH/bin/beru-agent" "$@"
EOF
