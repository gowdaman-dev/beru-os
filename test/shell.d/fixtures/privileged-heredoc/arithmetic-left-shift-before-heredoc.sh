mask=$((1 << bits))

cat >/etc/beru/agent.conf <<EOF
helper=$HOME/.local/share/beru/bin/beru-agent
EOF
