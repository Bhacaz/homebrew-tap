class GitBs < Formula
  desc "Interactive Git branch selector with fuzzy search and commit previews"
  homepage "https://github.com/Bhacaz/git-bs"
  version "0.2.2"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bhacaz/git-bs/releases/download/v0.2.2/git-bs-v0.2.2-macos-arm64.tar.gz"
      sha256 "c5f5fea1a2b25038dc3326e065af33a28cbc6df6274dd63c58a1cfdf77c85369"
    else
      url "https://github.com/Bhacaz/git-bs/releases/download/v0.2.2/git-bs-v0.2.2-macos-x86_64.tar.gz"
      sha256 "9dab4c6f48b557baa358d603da32d0abb4d90894797ba4d9b686113bfb651c67"
    end
  elsif Hardware::CPU.arm?
    url "https://github.com/Bhacaz/git-bs/releases/download/v0.2.2/git-bs-v0.2.2-linux-arm64.tar.gz"
    sha256 "6c8f1e509bec1cc0e001e57eb94f0577c83375661a70574d4ead00d3200616c9"
  else
    url "https://github.com/Bhacaz/git-bs/releases/download/v0.2.2/git-bs-v0.2.2-linux-x86_64.tar.gz"
    sha256 "f96cfa2a368d132092ecc7c8da9ec65a52cc017f2ae4d314edc31a4561e7e746"
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
