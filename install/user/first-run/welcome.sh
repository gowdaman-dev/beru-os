# Real newlines, not a literal \n: the card renders the body as it arrives, and
# elides past three lines.
beru-notification-send -u critical -g  "Learn Keybindings" \
  $'Super + K for cheatsheet.\nSuper + Space for Beru Menu.' \
  --exec beru-menu-keybindings
