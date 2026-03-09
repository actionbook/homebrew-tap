# typed: false
# frozen_string_literal: true

# Formula auto-updated by actionbook/actionbook release CI.
# Manual edits will be overwritten on the next release.
class Actionbook < Formula
  desc "CLI for Actionbook - run AI actions from your terminal"
  homepage "https://actionbook.dev"
  version "0.9.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v0.9.0/actionbook-darwin-arm64"
      sha256 "34db09ceec7f48428167f72321acb2611c3f1851a9b9a378e93134e774fa56b0"
    else
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v0.9.0/actionbook-darwin-x64"
      sha256 "5fc602582dc56c8e97857e3211bb8dc749eedd23c6c01f61a197ba998aa8effb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v0.9.0/actionbook-linux-arm64"
      sha256 "fb74f8726afcf971007fb7beaa5292cd904fc7bc7f6a2b0504a04ab220f7d82d"
    else
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v0.9.0/actionbook-linux-x64"
      sha256 "53b698c6731206f5dddb63e478ddc9625698540668e4197e12f8968faf2c4a7c"
    end
  end

  def install
    binary_name = "actionbook"
    if OS.mac?
      bin.install (Hardware::CPU.arm? ? "actionbook-darwin-arm64" : "actionbook-darwin-x64") => binary_name
    else
      bin.install (Hardware::CPU.arm? ? "actionbook-linux-arm64" : "actionbook-linux-x64") => binary_name
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/actionbook --version")
  end
end
