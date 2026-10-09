if true; then
  cat <<-EOF | sudo tee /etc/beru/indented.conf >/dev/null
	helper=$HOME/.local/share/beru/bin/beru-agent
	EOF
fi
