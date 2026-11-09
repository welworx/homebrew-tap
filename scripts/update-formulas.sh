#!/usr/bin/env bash
# Bumps each Formula/*.rb to its source repo's latest GitHub release.
set -euo pipefail

changed=0
summary=""

# Formulas that install prebuilt binaries (no source build). Their release ships a ready-made
# formula as the asset "<name>.rb" (one url/sha256 per platform), so it is copied as it is.
# A release without that asset (an older one) is skipped.
binary_formulas="dimvexa:welworx/dimvexa"

for entry in $binary_formulas; do
  name=${entry%%:*}
  repo=${entry#*:}
  formula="Formula/$name.rb"
  tag=$(gh api "repos/$repo/releases/latest" --jq .tag_name)
  tmpfile=$(mktemp)
  if curl -fsL "https://github.com/$repo/releases/download/$tag/$name.rb" -o "$tmpfile" \
     && grep -q "^class " "$tmpfile"; then
    if ! cmp -s "$tmpfile" "$formula"; then
      echo "Updating $name to $tag"
      cp "$tmpfile" "$formula"
      changed=1
      summary="${summary}${name}: -> ${tag}
"
    fi
  else
    echo "Skipping $name: release $tag has no $name.rb asset"
  fi
  rm -f "$tmpfile"
done

for formula in Formula/*.rb; do
  name=$(basename "$formula" .rb)
  # Binary formulas are handled above.
  case " $binary_formulas " in *" $name:"*) continue ;; esac
  repo=$(grep -oE 'github\.com/[^/]+/[^/"]+' "$formula" | head -1 | sed 's#github.com/##')
  current_url=$(grep -oE 'url "[^"]+"' "$formula" | head -1 | sed 's/url "//;s/"$//')
  current_tag=$(echo "$current_url" | grep -oE 'tags/[^/]+\.tar\.gz$' | sed 's#tags/##;s#\.tar\.gz$##')

  latest_tag=$(gh api "repos/$repo/releases/latest" --jq .tag_name)

  if [ "$latest_tag" != "$current_tag" ]; then
    echo "Updating $name: $current_tag -> $latest_tag"
    new_url="https://github.com/$repo/archive/refs/tags/${latest_tag}.tar.gz"
    tmpfile=$(mktemp)
    curl -sL "$new_url" -o "$tmpfile"
    new_sha=$(shasum -a 256 "$tmpfile" | cut -d' ' -f1)
    rm -f "$tmpfile"
    sed -i.bak "s#url \".*\"#url \"$new_url\"#" "$formula"
    sed -i.bak "s#sha256 \".*\"#sha256 \"$new_sha\"#" "$formula"
    rm -f "$formula.bak"
    changed=1
    summary="${summary}${name}: ${current_tag} -> ${latest_tag}
"
  fi
done

if [ -n "${GITHUB_OUTPUT:-}" ]; then
  echo "changed=$changed" >> "$GITHUB_OUTPUT"
  {
    echo "summary<<FORMULA_UPDATE_EOF"
    printf '%s' "$summary"
    echo "FORMULA_UPDATE_EOF"
  } >> "$GITHUB_OUTPUT"
fi
