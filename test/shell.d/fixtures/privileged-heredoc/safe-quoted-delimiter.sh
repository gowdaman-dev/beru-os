cat <<'EOF' | sudo tee /etc/udev/rules.d/99-beru.rules >/dev/null
SUBSYSTEM=="power_supply", RUN+="/usr/bin/beru-powerprofiles-set $HOME"
EOF

cat <<"XML" | sudo tee /etc/beru/agent.xml >/dev/null
<config path="$HOME/.local/share/beru" />
XML
