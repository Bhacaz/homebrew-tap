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
(Apple Silicon or Intel) and Linux (x86-64 or ARM64). It also sets your global
Git `bs` alias to the stable Homebrew executable path. Git reads its alias
configuration on every invocation, so `git bs` works immediately after install;
there is no shell file to source. This replaces any previous global `bs` alias.
Remove it later with `git config --global --unset alias.bs` if needed.
