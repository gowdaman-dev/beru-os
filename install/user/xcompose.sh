# Set default XCompose that is triggered with CapsLock
tee ~/.XCompose >/dev/null <<EOF
# Run beru-restart-xcompose to apply changes

# Include fast emoji access
include "/usr/share/beru/default/xcompose"

# Identification
<Multi_key> <space> <n> : "$BERU_USER_NAME"
<Multi_key> <space> <e> : "$BERU_USER_EMAIL"
EOF
