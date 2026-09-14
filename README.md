# termite09/tap

Homebrew casks for [termite09](https://github.com/termite09)'s apps.

```bash
brew install --cask termite09/tap/bubble-for-messenger
```

Use the full `termite09/tap/…` name: Homebrew 6+ requires third-party taps to be trusted, and
installing by full name trusts just this cask.

Bubble for Messenger is not signed with an Apple developer certificate, so macOS blocks the
first launch. Right-click `Bubble.app` in Applications → Open → Open, or clear the quarantine
flag once:

```bash
xattr -d com.apple.quarantine /Applications/Bubble.app
```

The cask is updated automatically by the
[release workflow](https://github.com/termite09/bubble-for-messenger/blob/main/.github/workflows/release.yml)
in the app repo whenever a version tag is pushed there.
