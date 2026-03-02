# typed: false
# frozen_string_literal: true

# Formula auto-updated by actionbook/actionbook release CI.
# Manual edits will be overwritten on the next release.
class Actionbook < Formula
  desc "CLI for Actionbook - run AI actions from your terminal"
  homepage "https://actionbook.dev"
  version "0.8.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v0.8.3/actionbook-darwin-arm64"
      sha256 "436801f6f2b4110eb3437a16409d6add5191b66aea478c599c8460afcfc373d2"
    else
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v0.8.3/actionbook-darwin-x64"
      sha256 "590f7a1bc31d4f73e6cf54db278cf715323250354a564feebfdb05c25776400f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v0.8.3/actionbook-linux-arm64"
      sha256 "fd203c5d8da527025a713f36ceaa74fdc6fc854d21ddff68bb23af2a0add36f3"
    else
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v0.8.3/actionbook-linux-x64"
      sha256 "1fb6d234b4cf194701acbab24b98eb91485a9119303cf35b54ece4260f959007"
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
