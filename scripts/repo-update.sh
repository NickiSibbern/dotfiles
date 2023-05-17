#!/bin/bash
set -uo pipefail

BASE_DIR="${1:-$HOME/Developer/source}"
MAX_JOBS="${MAX_JOBS:-8}"

echo "Scanning repos under: $BASE_DIR"
echo

update_repo() {
  repo_dir="$1"
  {
    echo "=== Repo: $repo_dir ==="

    cd "$repo_dir" || {
      echo "Failed to cd into $repo_dir"
      echo
      exit 0
    }

    current_branch="$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo 'UNKNOWN')"
    echo "Current branch: $current_branch"

    if ! git diff --quiet || ! git diff --cached --quiet; then
      echo "Stashing local changes..."
      git stash || echo "Stash failed in $repo_dir"
    else
      echo "No local changes to stash."
    fi

    default_branch=""
    if git rev-parse --abbrev-ref origin/HEAD >/dev/null 2>&1; then
      default_branch="$(git rev-parse --abbrev-ref origin/HEAD | sed 's|^origin/||')"
    elif git show-ref --verify --quiet refs/heads/main; then
      default_branch="main"
    elif git show-ref --verify --quiet refs/heads/master; then
      default_branch="master"
    else
      echo "Could not determine default branch, skipping."
      exit 0
    fi

    echo "Switching to default branch: $default_branch"
    git checkout "$default_branch" || echo "Checkout failed in $repo_dir"

    echo "Pulling latest changes..."
    git pull --ff-only || git pull --rebase || echo "Pull failed in $repo_dir"

  } 2>&1
}

export -f update_repo

# Use xargs to run update_repo in parallel
find "$BASE_DIR" -type d -name ".git" -print0 \
  | xargs -0 -n1 -P"$MAX_JOBS" -I{} bash -lc 'update_repo "$(dirname "{}")"'

echo "All done."
