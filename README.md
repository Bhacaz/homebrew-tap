# homebrew-tap
Homebrew formulas

## git-bs

Interactive Git branch selection in Rust, with fuzzy search and commit previews.

```sh
brew install Bhacaz/tap/git-bs
git bs
```

The formula downloads a platform binary from the
[v0.2.0 release](https://github.com/Bhacaz/git-bs/releases/tag/v0.2.0): macOS
(Apple Silicon or Intel) and Linux (x86-64 or ARM64). Git discovers the
installed `git-bs` executable automatically, so `git bs` works immediately
without an alias or shell reload. Homebrew's install sandbox cannot change your
global Git configuration. If an older `bs` alias points elsewhere, set it
explicitly after install:

```sh
git config --global alias.bs "!$(brew --prefix git-bs)/bin/git-bs"
```

Git reads that change on the next invocation; there is no shell file to source.
