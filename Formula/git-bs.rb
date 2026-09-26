class GitBs < Formula
  desc "Interactive Git branch selector with fuzzy search and commit previews"
  homepage "https://github.com/Bhacaz/git-bs"
  version "0.2.1"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bhacaz/git-bs/releases/download/v0.2.1/git-bs-v0.2.1-macos-arm64.tar.gz"
      sha256 "95359faa86f7f7f346e836c98f834b98baf4b95266d2e26435aabb920960c4d8"
    else
      url "https://github.com/Bhacaz/git-bs/releases/download/v0.2.1/git-bs-v0.2.1-macos-x86_64.tar.gz"
      sha256 "e2eb2f7b3fce7e95335df621d1205626d3b2032988638cb9f549a3921e006ed6"
    end
  elsif Hardware::CPU.arm?
    url "https://github.com/Bhacaz/git-bs/releases/download/v0.2.1/git-bs-v0.2.1-linux-arm64.tar.gz"
    sha256 "aba9917799d06f507eb4236db0f2a142980051cbedaf84041220f09cf190aa36"
  else
    url "https://github.com/Bhacaz/git-bs/releases/download/v0.2.1/git-bs-v0.2.1-linux-x86_64.tar.gz"
    sha256 "fc23c378010f23b8a4320deb977f4bc3177638bc19110b62d9f6b2c230e2eff3"
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
