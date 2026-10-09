tmp=/tmp/beru-generated
cat >"$tmp" <<EOF
command=$HOME/.local/share/beru/bin/example
EOF
sudo install -m644 "${tmp}" /etc/beru/example.conf
