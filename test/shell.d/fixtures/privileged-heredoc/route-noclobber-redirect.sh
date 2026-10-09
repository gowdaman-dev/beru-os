# `>|` is a plain redirect with noclobber overridden, not a redirect into a pipe.
cat >|/etc/beru/agent.conf <<EOF
helper=$HOME/.local/share/beru/bin/beru-agent
EOF
