#!/usr/bin/env bash
set -euo pipefail

echo "NovaUI 9 N976N source sanity check"
command -v git >/dev/null 2>&1 || { echo "git is required" >&2; exit 1; }
git rev-parse --show-toplevel
git status --short
echo "No device operations are performed by this script."
