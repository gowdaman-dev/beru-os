#!/bin/bash

set -euo pipefail

source "$(dirname "$0")/base-test.sh"

test_tmp=$(mktemp -d)
trap 'rm -rf "$test_tmp"' EXIT

stub_bin="$test_tmp/bin"
shell_calls="$test_tmp/shell-calls"
mkdir -p "$stub_bin"

cat >"$stub_bin/beru-update-available" <<'SH'
#!/bin/bash

exit "${UPDATE_AVAILABLE_STATUS:-0}"
SH

cat >"$stub_bin/beru-shell" <<'SH'
#!/bin/bash

printf '%s\n' "$*" >>"$SHELL_CALLS"
SH

chmod +x "$stub_bin/beru-update-available" "$stub_bin/beru-shell"

PATH="$stub_bin:$PATH" SHELL_CALLS="$shell_calls" UPDATE_AVAILABLE_STATUS=0 \
  "$ROOT/bin/beru-update-status"
grep -Fx -- "-q beru.system-update refresh" "$shell_calls" >/dev/null ||
  fail "update status refreshes the shell indicator when updates remain"
pass "update status refreshes the shell indicator when updates remain"

: >"$shell_calls"
PATH="$stub_bin:$PATH" SHELL_CALLS="$shell_calls" UPDATE_AVAILABLE_STATUS=1 \
  "$ROOT/bin/beru-update-status"
grep -Fx -- "-q beru.system-update clear" "$shell_calls" >/dev/null ||
  fail "update status clears the shell indicator when no updates remain"
pass "update status clears the shell indicator when no updates remain"
