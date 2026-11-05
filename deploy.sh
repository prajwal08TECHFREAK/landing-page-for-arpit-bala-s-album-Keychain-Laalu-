#!/usr/bin/env bash
# ---------------------------------------------------------------
# deploy.sh — push the Keychain Laalu page to your GitHub repo
#
#   ./deploy.sh                          # uses the URL below
#   ./deploy.sh git@github.com:you/repo.git
#   ./deploy.sh https://github.com/you/repo.git "my commit message"
#
# Requirements: git, and either SSH keys set up or a credential
# helper / personal access token for HTTPS.
# ---------------------------------------------------------------
set -euo pipefail

REMOTE="${1:-}"
MESSAGE="${2:-Keychain Laalu landing page}"

cd "$(dirname "$0")"

if [ -z "$REMOTE" ]; then
  echo "No remote given."
  echo "Usage: ./deploy.sh https://github.com/<you>/<repo>.git [commit message]"
  echo
  echo "New repo? Create an empty one on github.com first (no README), then rerun."
  exit 1
fi

# keep the generated preview art out of the repo
if [ ! -f .gitignore ]; then
  printf 'node_modules/\n.DS_Store\nThumbs.db\n' > .gitignore
fi

if [ ! -d .git ]; then
  git init -q
  echo "→ initialised a fresh repo"
fi

git add -A

if git diff --cached --quiet; then
  echo "→ nothing new to commit"
else
  git -c user.name="$(git config user.name || echo "${USER:-you}")" \
      -c user.email="$(git config user.email || echo "you@example.com")" \
      commit -q -m "$MESSAGE"
  echo "→ committed: $MESSAGE"
fi

git branch -M main

if git remote | grep -qx origin; then
  git remote set-url origin "$REMOTE"
else
  git remote add origin "$REMOTE"
fi

echo "→ pushing to $REMOTE"
git push -u origin main

echo
echo "Done. Now turn on GitHub Pages:"
echo "  1. Repo → Settings → Pages"
echo "  2. Source: Deploy from a branch"
echo "  3. Branch: main   ·   Folder: / (root)   → Save"
echo
echo "Live in a minute or two at:"
echo "  https://$(echo "$REMOTE" | sed -E 's#.*github\.com[:/]([^/]+)/([^/.]+).*#\1.github.io/\2#')/"
