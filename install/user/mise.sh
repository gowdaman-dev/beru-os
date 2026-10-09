# Upgrades must not delete the version a running process is executing from:
# mise up would prune the old install dir out from under a live session.
mise settings set upgrade.auto_prune false

beru-mise-install codex
beru-mise-install claude
beru-mise-install crush
beru-mise-install antigravity-cli agy
beru-mise-install gh
beru-mise-install copilot
beru-mise-install opencode
beru-mise-install npm:playwright playwright
beru-mise-install pi
beru-mise-install github:can1357/oh-my-pi omp
beru-mise-install grok
# Cursor's own installer links the same path, so a re-provision keeps it.
beru-cmd-missing cursor-agent && beru-mise-install cursor-agent
beru-mise-install npm:@kitlangton/ghui ghui
beru-mise-install aqua:modem-dev/hunk hunk
beru-mise-install github:basecamp/hey-cli hey
beru-mise-install github:basecamp/basecamp-cli basecamp
beru-mise-install npm:cf cf
beru-mise-install github:OpenRouterLabs/ori-releases ori
if beru-cmd-missing muse; then
  beru-mise-install "http:muse[url=https://api.meta.ai/muse-launcher.sh,bin=muse,version_list_url=https://api.meta.ai/muse-code/channels/muse-stable,version_json_path=.version]" muse
fi

# Build the account dispatchers declared by /etc/mise/conf.d.
mise reshim
