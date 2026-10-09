#!/bin/bash

cat <<EOF | \
  sudo tee /etc/beru/review.conf
ExecStart=$HOME/.local/bin/payload
EOF
