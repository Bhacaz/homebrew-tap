class GitBs < Formula
  desc "Interactive Git branch selector with fuzzy search and commit previews"
  homepage "https://github.com/Bhacaz/git-bs"
  version "0.2.3"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bhacaz/git-bs/releases/download/v0.2.3/git-bs-v0.2.3-macos-arm64.tar.gz"
      sha256 "5e3800ec6ed963c27afdb4ae58fa66c1e1b4ff083706af04aa07ea7aa72df833"
    else
      url "https://github.com/Bhacaz/git-bs/releases/download/v0.2.3/git-bs-v0.2.3-macos-x86_64.tar.gz"
      sha256 "2de9860f897ee66a069bc465a5f18cf0a33a62f3d286c317fb7a4c83bd97138c"
    end
  elsif Hardware::CPU.arm?
    url "https://github.com/Bhacaz/git-bs/releases/download/v0.2.3/git-bs-v0.2.3-linux-arm64.tar.gz"
    sha256 "be994723440732ebdf681c482f6da790cf06828a79bd253acc06c8387b416bf6"
  else
    url "https://github.com/Bhacaz/git-bs/releases/download/v0.2.3/git-bs-v0.2.3-linux-x86_64.tar.gz"
    sha256 "2ed2467fcb95e758651b520e58cf13556ecb3a3831a4be9a9936626079cf4006"
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
