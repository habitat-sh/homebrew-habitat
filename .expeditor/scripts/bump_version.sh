#!/bin/bash

# This script automates the modification of our Homebrew tap for the
# `hab` binary.

set -euo pipefail

if ! sed --version 2>&1 | grep -q "GNU sed"; then
    echo "This script requires GNU sed; aborting"
    exit 1
fi

environment_name="${1:-stable}"
s3_prefix="http://${s3_bucket_name}.s3.amazonaws.com/${environment_name}/latest/habitat/"

ensure_files_changed() {
    # git diff --exit-code returns 0 if there are no changes
    if git diff --exit-code; then
       echo "Expected sed command to make a change, but it didn't!"
       exit 1
    fi
}

# Retrieves the current package manifest for the given environment.
#
# After GPG verifying the file, returns the JSON on standard output,
# suitable for piping into `jq`.
#
# e.g. manifest_for_environment acceptance | jq
manifest_for_environment() {
    curl --silent \
         --remote-name \
         "${s3_prefix}/manifest.json"
    curl --silent \
         --remote-name \
         "${s3_prefix}/manifest.json.asc"
    gpg_verify "manifest.json"
    cat "manifest.json"
}

# Using the first element of the array is safe because we only ever build one darwin artifact
ident="$(manifest_for_environment "stable" | jq -r '.packages | ."x86_64-darwin" | .[0]')"

version="$(cut -d'/' -f3 <<< "$ident")"
release="$(cut -d'/' -f4 <<< "$ident")"
sha256="$(curl "${s3_prefix}/hab-${version}-${release}-x86_64-darwin.zip.sha256sum" | cut -d' ' -f1)"


branch="ci/brew-update-$new_version-$(date +"%Y%m%d%H%M%S")"
git checkout -b "$branch"

echo "--- Modifying hab Homebrew Formula"
sed --in-place \
    --regexp-extended \
    's/current_version="(.*)"/current_version="'"${version}"'"/g' \
    Formula/hab.rb
ensure_files_changed
git add Formula/hab.rb

sed --in-place \
    --regexp-extended \
    's/current_release="(.*)"/current_release="'"${release}"'"/g' \
    Formula/hab.rb
ensure_files_changed
git add Formula/hab.rb

sed --in-place \
    --regexp-extended \
    's/current_sha256="(.*)"/current_sha256="'"${sha256}"'"/g' \
    Formula/hab.rb
ensure_files_changed
git add Formula/hab.rb

echo "--- :github: Committing updates to Github"
# Display what changed
git diff --staged
git commit --signoff --message "Bump version to ${new_version}"

# https://expeditor.chef.io/docs/reference/script/#open-pull-request
open_pull_request

git checkout master
git branch -D "$branch"

