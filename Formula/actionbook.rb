# typed: false
# frozen_string_literal: true

# Formula auto-updated by actionbook/actionbook release CI.
# Manual edits will be overwritten on the next release.
class Actionbook < Formula
  desc "CLI for Actionbook - run AI actions from your terminal"
  homepage "https://actionbook.dev"
  version "0.8.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v0.8.4/actionbook-darwin-arm64"
      sha256 "63c9a7762fc73198504e43b6f77613726e84e540c8521097576b3f86db78265a"
    else
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v0.8.4/actionbook-darwin-x64"
      sha256 "fec3637c2d32e839efcb3431fbfa88dedfe622f7aab40303899fa7ccd409a8ba"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v0.8.4/actionbook-linux-arm64"
      sha256 "7c75f02b7e1a86a9809de4c66704f5b4575597e343e54a53a1556b885a135688"
    else
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v0.8.4/actionbook-linux-x64"
      sha256 "98cfe20d0a74ae669e4c435996860f87014d711d4ba01a3efaf60526d4e2cd6c"
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
