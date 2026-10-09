tmp=/tmp/beru-generated
copy=$tmp
cat >"$tmp" <<EOF
command=$HOME/.local/share/beru/bin/example
EOF
sudo install -m644 "$copy" /etc/beru/example.conf
