# A plain redirect into /etc, no sudo: the command re-execs itself as root.
cat >/etc/beru/agent.conf <<EOF
helper=$HOME/.local/share/beru/bin/beru-agent
EOF
