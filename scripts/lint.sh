#!/bin/bash
# scripts/lint.sh - Run shellcheck on all shell scripts
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

echo "🔍 Running shellcheck..."
echo

# Run shellcheck on all relevant files
shellcheck -x \
    "$PROJECT_ROOT/bin/usb-driver" \
    "$PROJECT_ROOT/lib/"*.sh \
    "$PROJECT_ROOT/scripts/"*.sh

echo
echo "✅ All checks passed!"
