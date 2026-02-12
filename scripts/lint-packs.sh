#!/usr/bin/env bash
# lint-packs.sh — Validate Context Pack structure and formatting
# Usage: ./scripts/lint-packs.sh [pack-directory ...]
# If no arguments, validates all packs in the repo root.

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
ERRORS=0
WARNINGS=0

red()    { printf '\033[0;31m%s\033[0m\n' "$1"; }
yellow() { printf '\033[0;33m%s\033[0m\n' "$1"; }
green()  { printf '\033[0;32m%s\033[0m\n' "$1"; }

error() {
  red "ERROR: $1"
  ERRORS=$((ERRORS + 1))
}

warn() {
  yellow "WARN:  $1"
  WARNINGS=$((WARNINGS + 1))
}

ok() {
  printf '  OK:  %s\n' "$1"
}

# Collect pack directories
if [ $# -gt 0 ]; then
  PACKS=("$@")
else
  PACKS=()
  for dir in "$REPO_ROOT"/*/; do
    # Skip scripts, .git, and other non-pack directories
    dirname="$(basename "$dir")"
    [ "$dirname" = "scripts" ] && continue
    [ "$dirname" = ".git" ] && continue
    [ "$dirname" = ".github" ] && continue
    [ "$dirname" = "node_modules" ] && continue
    PACKS+=("$dir")
  done
fi

echo "============================================"
echo "Context Pack Linter"
echo "============================================"
echo ""

for pack_dir in "${PACKS[@]}"; do
  pack_dir="${pack_dir%/}"
  pack_name="$(basename "$pack_dir")"
  echo "--- $pack_name ---"

  # 1. Check CONTEXT.md exists
  context_file="$pack_dir/CONTEXT.md"
  if [ ! -f "$context_file" ]; then
    error "$pack_name: Missing CONTEXT.md"
    echo ""
    continue
  fi
  ok "CONTEXT.md exists"

  # 2. Check YAML frontmatter exists and has required fields
  if ! head -1 "$context_file" | grep -q '^---$'; then
    error "$pack_name/CONTEXT.md: Missing YAML frontmatter (no opening ---)"
  else
    # Extract frontmatter (between first and second --- lines)
    frontmatter=$(awk 'BEGIN{found=0} /^---$/{found++; next} found==1{print} found>=2{exit}' "$context_file")

    # Check 'name' field
    if echo "$frontmatter" | grep -q '^name:'; then
      fm_name=$(echo "$frontmatter" | grep '^name:' | sed 's/^name:[[:space:]]*//')
      if [ -z "$fm_name" ]; then
        error "$pack_name/CONTEXT.md: 'name' field is empty"
      else
        ok "Frontmatter 'name: $fm_name'"
      fi
    else
      error "$pack_name/CONTEXT.md: Missing 'name' field in frontmatter"
    fi

    # Check 'description' field
    if echo "$frontmatter" | grep -q '^description:'; then
      fm_desc=$(echo "$frontmatter" | grep '^description:' | sed 's/^description:[[:space:]]*//')
      if [ -z "$fm_desc" ]; then
        error "$pack_name/CONTEXT.md: 'description' field is empty"
      else
        ok "Frontmatter 'description' present"
      fi
    else
      error "$pack_name/CONTEXT.md: Missing 'description' field in frontmatter"
    fi
  fi

  # 3. Check for broken internal links
  # Extract markdown links like [text](filename) where filename doesn't start with http
  {
    sed -n 's/.*\[.*\](\([^)]*\)).*/\1/p' "$context_file" 2>/dev/null | grep -v '^http' || true
  } | while read -r linked_file; do
    if [ -n "$linked_file" ] && [ ! -f "$pack_dir/$linked_file" ]; then
      error "$pack_name/CONTEXT.md: Broken link to '$linked_file'"
    fi
  done

  # Check backtick-referenced .md files in CONTEXT.md (e.g., `players.md`)
  {
    sed -n 's/.*`\([a-zA-Z0-9_-]*\.md\)`.*/\1/p' "$context_file" 2>/dev/null | sort -u || true
  } | while read -r ref_file; do
    if [ -n "$ref_file" ] && [ ! -f "$pack_dir/$ref_file" ]; then
      warn "$pack_name/CONTEXT.md: References '$ref_file' but file does not exist"
    fi
  done

  # 4. Check heading structure — should start with H1
  first_heading=$(grep -m1 '^#' "$context_file" | head -1)
  if [ -n "$first_heading" ]; then
    if ! echo "$first_heading" | grep -q '^# [^#]'; then
      warn "$pack_name/CONTEXT.md: First heading is not H1"
    else
      ok "Heading structure starts with H1"
    fi
  else
    warn "$pack_name/CONTEXT.md: No headings found"
  fi

  # 5. Validate optional files have reasonable structure
  for optional_file in players.md terminology.md sources.md; do
    filepath="$pack_dir/$optional_file"
    if [ -f "$filepath" ]; then
      # Check it has at least one heading
      if ! grep -q '^#' "$filepath"; then
        warn "$pack_name/$optional_file: No headings found"
      else
        ok "$optional_file present and has headings"
      fi
    fi
  done

  echo ""
done

echo "============================================"
echo "Results: $ERRORS error(s), $WARNINGS warning(s)"
echo "============================================"

if [ "$ERRORS" -gt 0 ]; then
  red "FAILED"
  exit 1
else
  green "PASSED"
  exit 0
fi
