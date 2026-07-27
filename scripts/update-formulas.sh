#!/usr/bin/env bash
# Bumps each Formula/*.rb to its source repo's latest GitHub release.
set -euo pipefail

changed=0

for formula in Formula/*.rb; do
  repo=$(grep -oE 'github\.com/[^/]+/[^/"]+' "$formula" | head -1 | sed 's#github.com/##')
  current_url=$(grep -oE 'url "[^"]+"' "$formula" | head -1 | sed 's/url "//;s/"$//')
  current_tag=$(echo "$current_url" | grep -oE 'tags/[^/]+\.tar\.gz$' | sed 's#tags/##;s#\.tar\.gz$##')

  latest_tag=$(gh api "repos/$repo/releases/latest" --jq .tag_name)

  if [ "$latest_tag" != "$current_tag" ]; then
    echo "Updating $(basename "$formula" .rb): $current_tag -> $latest_tag"
    new_url="https://github.com/$repo/archive/refs/tags/${latest_tag}.tar.gz"
    tmpfile=$(mktemp)
    curl -sL "$new_url" -o "$tmpfile"
    new_sha=$(shasum -a 256 "$tmpfile" | cut -d' ' -f1)
    rm -f "$tmpfile"
    sed -i.bak "s#url \".*\"#url \"$new_url\"#" "$formula"
    sed -i.bak "s#sha256 \".*\"#sha256 \"$new_sha\"#" "$formula"
    rm -f "$formula.bak"
    changed=1
  fi
done

if [ -n "${GITHUB_OUTPUT:-}" ]; then
  echo "changed=$changed" >> "$GITHUB_OUTPUT"
fi
