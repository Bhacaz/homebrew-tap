class GitBs < Formula
  desc "Interactive Git branch selector with fuzzy search and commit previews"
  homepage "https://github.com/Bhacaz/git-bs"
  version "0.2.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bhacaz/git-bs/releases/download/v0.2.0/git-bs-v0.2.0-macos-arm64.tar.gz"
      sha256 "7fdfdbb6a9fe97f60ce0e51a75864db091b4d188ddf640e81a6f9fd853f9850f"
    else
      url "https://github.com/Bhacaz/git-bs/releases/download/v0.2.0/git-bs-v0.2.0-macos-x86_64.tar.gz"
      sha256 "beaf63e79e00f862adbeb26f36f0ecedbdef3a0748d6aa20afc4eaa428a8a1ae"
    end
  elsif Hardware::CPU.arm?
    url "https://github.com/Bhacaz/git-bs/releases/download/v0.2.0/git-bs-v0.2.0-linux-arm64.tar.gz"
    sha256 "30fa9edfd58b9e0e23ae9c1a54586cbebaea0da5e3f84ce557aaf23dab4953e3"
  else
    url "https://github.com/Bhacaz/git-bs/releases/download/v0.2.0/git-bs-v0.2.0-linux-x86_64.tar.gz"
    sha256 "27edd28e2d059f88df6a67374b5b651aadd47fe442deffa0faaa6ab9d04ad247"
  end

  uses_from_macos "git"

  def install
    bin.install "git-bs"
  end

  def caveats
    <<~EOS
      Git discovers git-bs automatically, so `git bs` works without a shell reload.
      If an older bs alias points elsewhere, replace it with:
        git config --global alias.bs '!#{opt_bin}/git-bs'
      Git reads alias changes on the next invocation; no sourcing is needed.
    EOS
  end

  test do
    assert_match "git-bs #{version}", shell_output("#{bin}/git-bs --version")
    system "git", "init", "empty-repo"
    cd "empty-repo" do
      assert_match "No local branches", shell_output("#{bin}/git-bs --list")
    end
  end
end
