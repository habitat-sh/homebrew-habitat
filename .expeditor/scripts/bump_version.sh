#!/usr/bin/env bash
#
# This script automates the modification of our Homebrew tap for the
# `hab` binary.

set -euo pipefail

if [[ $(uname -s) == Darwin ]]; then
  function sed() {
      command gsed "$@"
  }
fi

url_prefix="https://packages.chef.io/files/stable/habitat/latest/"

ensure_files_changed() {
    # git diff --exit-code returns 0 if there are no changes
    if git diff --exit-code; then
       echo "Expected sed command to make a change, but it didn't!"
       exit 1
    fi
}

# Retrieves the current package manifest for the given environment.
#
# e.g. manifest_for_environment acceptance | jq
get_manifest() {
    curl --silent \
         --remote-name \
         "${url_prefix}/manifest.json"
    cat "manifest.json"
}

version="$(get_manifest | jq -r '.version')"
darwin_intel_sha256="$(curl "${url_prefix}/hab-x86_64-darwin.zip.sha256sum" | cut -d' ' -f1)"
darwin_arm_sha256="$(curl "${url_prefix}/hab-aarch64-darwin.zip.sha256sum" | cut -d' ' -f1)"

branch="ci/brew-update-$version-$(date +"%Y%m%d%H%M%S")"
git checkout -b "$branch"

echo "--- Modifying hab Homebrew Formula"
sed --in-place \
    --regexp-extended \
    's/(current_version\s*=\s*)".*"/\1"'"${version}"'"/g' \
    Formula/hab.rb
ensure_files_changed
git add Formula/hab.rb

sed --in-place \
    --regexp-extended \
    's/(current_darwin_intel_sha256\s*=\s*)".*"/\1"'"${darwin_intel_sha256}"'"/g' \
    Formula/hab.rb
sed --in-place \
    --regexp-extended \
    's/(current_darwin_arm_sha256\s*=\s*)".*"/\1"'"${darwin_arm_sha256}"'"/g' \
    Formula/hab.rb
ensure_files_changed
git add Formula/hab.rb

echo "--- :github: Committing updates to Github"
# Display what changed
git diff --staged
git commit --signoff --message "Bump version to ${version}"

# https://expeditor.chef.io/docs/reference/script/#open-pull-request
open_pull_request

git checkout main
git branch -D "$branch"

