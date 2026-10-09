#!/bin/bash

# beru:heredoc-expands paths=none -- review regression fixture
sudo tee /etc/beru/review.conf >/dev/null <<EOF
ExecStart=${target:-$HOME/.local/bin/payload}
EOF
