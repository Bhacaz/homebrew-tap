class GitBs < Formula
  desc "Interactive Git branch selector with fuzzy search and commit previews"
  homepage "https://github.com/Bhacaz/git-bs"
  url "https://github.com/Bhacaz/git-bs/releases/download/v0.1.0/git-bs-0.1.0.tar.gz"
  sha256 "1f9b5b91a260bdd9570775ec81d02af8382ef85162d3c7b1f6857e8e16dedb6c"
  license "MIT"

  depends_on "rust" => :build
  uses_from_macos "git"

  def install
    system "cargo", "build", "--release", "--locked"
    bin.install "target/release/git-bs"
  end

  test do
    assert_match "git-bs #{version}", shell_output("#{bin}/git-bs --version")
    system "git", "init", "empty-repo"
    cd "empty-repo" do
      assert_match "No local branches", shell_output("#{bin}/git-bs --list")
    end
  end
end
