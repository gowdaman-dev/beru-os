#!/bin/bash

set -euo pipefail

source "$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)/base-test.sh"

TMPDIR=$(mktemp -d)
trap 'rm -rf "$TMPDIR"' EXIT
mkdir -p "$TMPDIR/home" "$TMPDIR/bin"
calls="$TMPDIR/calls"

cat >"$TMPDIR/bin/beru-shell" <<'SH'
#!/bin/bash
printf '%s\n' "$*" >>"$BERU_TEST_CALLS"
printf 'ok\n'
SH
chmod +x "$TMPDIR/bin/beru-shell"

run_enable() {
  HOME="$TMPDIR/home" \
    BERU_PATH="$ROOT" \
    BERU_TEST_CALLS="$calls" \
    PATH="$TMPDIR/bin:$ROOT/bin:$PATH" \
    beru-plugin-enable "$@"
}

run_enable beru.active-window --section right >/dev/null
grep -Fqx 'shell enablePlugin beru.active-window {"section":"right"}' "$calls" ||
  fail "plugin enable did not combine activation and placement"
pass "plugin enable combines activation and placement in one shell mutation"

run_enable beru.clock --before beru.weather >/dev/null
grep -Fqx 'shell enablePlugin beru.clock {"before":"beru.weather"}' "$calls" ||
  fail "plugin enable did not preserve relative placement"
pass "plugin enable forwards relative placement"

run_enable beru.dropbox >/dev/null
grep -Fqx 'shell enablePlugin beru.dropbox {}' "$calls" ||
  fail "plugin enable did not use manifest-default placement"
pass "plugin enable leaves default placement to the registry"

if run_enable beru.bar --section right >/dev/null 2>&1; then
  fail "plugin enable accepted placement for a full bar"
fi
pass "plugin enable rejects placement for full bars"
