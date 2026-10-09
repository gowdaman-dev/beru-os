# beru:heredoc-expands paths=none -- the positional argument is a scalar
sudo tee /etc/beru/example.conf <<EOF
argument=$1
command=$HOME/.local/share/beru/bin/example
EOF
