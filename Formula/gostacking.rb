# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Gostacking < Formula
  desc "Git stacking using merge"
  homepage "https://github.com/Bhacaz/gostacking"
  version "0.4.2"
  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/Bhacaz/gostacking/releases/download/v0.4.2/gostacking_Darwin_arm64.tar.gz"
    sha256 "05c694e2d9332824896e3611193b981a44b0be2e3a29ad29509480399b318fca"

    def install
      bin.install "gostacking"
      zsh_completion.install "completions/gostacking.zsh" => "_gostacking"
    end
  end
  if Hardware::CPU.intel?
    url "https://github.com/Bhacaz/gostacking/releases/download/v0.4.2/gostacking_Darwin_x86_64.tar.gz"
    sha256 "6982d2f1ef8dab6d73f3ce8553a1d3c1aeef731c0ae4b7cfc4b79280da43285b"

    def install
      bin.install "gostacking"
      zsh_completion.install "completions/gostacking.zsh" => "_gostacking"
    end
  end
end
