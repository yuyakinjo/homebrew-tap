# homebrew-tap

Homebrew tap for GitSquid.

## GitSquid

GitSquid is a simple Git GUI with a GitKraken-style commit graph, distributed as a macOS arm64 Homebrew Cask.

### Install

```bash
brew tap yuyakinjo/tap
brew trust yuyakinjo/tap
brew install --cask git-squid
```

### Update

GitSquid updates itself from within the app, so `brew upgrade` skips it by default. To update it through Homebrew instead:

```bash
brew update
brew upgrade --cask git-squid
```

### Uninstall

```bash
brew uninstall --cask git-squid
```

To also remove app support files:

```bash
brew uninstall --cask --zap git-squid
```

### macOS Security

GitSquid builds in this tap are arm64-only and intended for personal use. If macOS blocks the app because the build is not notarized, remove the quarantine attribute after installation:

```bash
xattr -dr com.apple.quarantine "/Applications/GitSquid.app"
```

## Migrating from Piron Orbit

Piron Orbit has been replaced by GitSquid and is no longer distributed. The `piron-orbit` cask is disabled: it can no longer be installed, and `brew upgrade` shows a warning pointing to `git-squid`.

To switch to GitSquid:

```bash
brew update
brew install --cask git-squid
brew uninstall --cask piron-orbit
```

GitSquid does not import Piron Orbit's settings. To also remove Piron Orbit's app support files, run `brew uninstall --cask --zap piron-orbit` instead of the last command.
