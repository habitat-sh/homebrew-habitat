Habitat Homebrew Tap
====================


For developers on MacOS, the [Habitat](https://habitat.sh) team
maintains a [Homebrew](https://brew.sh) tap that makes it easy to
install the `hab` command line client and keep up-to-date with the
latest stable releases.

Once you've [installed Homebrew](https://brew.sh/), add the tap with
the following command (this is a one-time operation):

```sh
brew tap habitat-sh/habitat
```

Then, installing the latest version of `hab` is just:

```sh
brew install hab
```

Thereafter, you can stay up-to-date with the latest stable release by
running:

```sh
brew upgrade hab
```

If you no longer wish to use the Habitat tab, you can uninstall it:

```sh
brew untap habitat-sh/habitat
```
