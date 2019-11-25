#!/bin/bash

# We want to ensure that the change in the current PR can result in an
# installable artifact!

set -euo pipefail

homebrew_installed_version() {
    brew info --json hab | \
        jq -r 'first | .installed | first | .version'
}

echo "--- Cleaning up existing hab installations"
# Delete any and all existing `hab` binaries
brew uninstall --force hab || true

# This is where the original `hab` in the Buildkite images is located.
rm -f /usr/local/bin/hab

# Delete any existing Homebrew tap
brew untap habitat-sh/habitat || true

echo "--- Tap and set testing branch"
# Do a full install of the tap. By default, Homebrew only uses shallow
# clones, but we want everything so we can switch to a new branch.
brew tap --full habitat-sh/habitat

# Clean up any old stuff
brew cleanup

# Checkout the new branch.
cd $(brew --repository)/Library/Taps/habitat-sh/homebrew-habitat
git checkout "${BUILDKITE_BRANCH}"

echo "--- Installing hab from ${BUILDKITE_BRANCH}"
# Without setting HOMEBREW_DEVELOPER, `brew install` will
# automatically re-check-out the master branch of the tap!
#
# (Also, for future reference, you have to be on a branch, not a
# detached HEAD, in order for this to work.)
export HOMEBREW_DEVELOPER=1
brew install hab

echo "--- Verify we installed the expected binary"
# Assert the new version matches with what's in the Formula.rb
expected_version="$(homebrew_installed_version)"

# Slice the version out of a string like
#    hab 0.88.0/20191009205151
actual_version="$(hab --version | cut -f2 -d" " | cut -f1 -d"/")"

if [[ "${actual_version}" != "${expected_version}" ]]; then
    echo "Expected to install ${expected_version}, but got ${actual_version} instead!"
    exit 1
fi

echo "--- Exercise the installed binary"

# Try to do something against Builder (exercise the SSL)
hab bldr channel list core
