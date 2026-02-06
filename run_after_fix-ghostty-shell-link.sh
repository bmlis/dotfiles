#!/usr/bin/env bash
set -euo pipefail

# Choose a zsh path deterministically
zsh_path=""

if command -v brew >/dev/null 2>&1; then
  cand="$(brew --prefix zsh 2>/dev/null)/bin/zsh" || true
  if [ -x "${cand:-}" ]; then
    zsh_path="$cand"
  fi
fi

if [ -z "$zsh_path" ]; then
  cand="$(command -v zsh 2>/dev/null || true)"
  if [ -n "$cand" ] && [ -x "$cand" ]; then
    zsh_path="$cand"
  fi
fi
[ -n "$zsh_path" ] || exit 0

# Put the stable symlink somewhere *you* control (works on macOS+Linux, no sudo)
mkdir -p "$HOME/.local/bin"
ln -sf "$zsh_path" "$HOME/.local/bin/zsh"

