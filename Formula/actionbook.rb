# typed: false
# frozen_string_literal: true

# Formula auto-updated by actionbook/actionbook release CI.
# Manual edits will be overwritten on the next release.
class Actionbook < Formula
  desc "CLI for Actionbook - run AI actions from your terminal"
  homepage "https://actionbook.dev"
  version "0.11.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v0.11.3/actionbook-darwin-arm64"
      sha256 "22f5a88da4f4cb79b2be459afd588ae02255c542fd2181a9ab52f3305a7c1bc2"
    else
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v0.11.3/actionbook-darwin-x64"
      sha256 "7696e46fdb5af4e841c7e2eec1149ddfbff67c153aaa9c2e467569e744f37359"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v0.11.3/actionbook-linux-arm64"
      sha256 "a46c4c2c10b43b5c03aa8d60c2430e7faf81f92e30b9f7d81dc275f3a7c3b134"
    else
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v0.11.3/actionbook-linux-x64"
      sha256 "6d6fc09e1f34cc76a8f8d36182ae9fb05cfd2e522a69cda352406340c2eea119"
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
