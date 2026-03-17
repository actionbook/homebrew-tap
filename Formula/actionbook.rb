# typed: false
# frozen_string_literal: true

# Formula auto-updated by actionbook/actionbook release CI.
# Manual edits will be overwritten on the next release.
class Actionbook < Formula
  desc "CLI for Actionbook - run AI actions from your terminal"
  homepage "https://actionbook.dev"
  version "0.10.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v0.10.0/actionbook-darwin-arm64"
      sha256 "94886bf2fe3b90f48725990d74ec10f5ff27f72df69df9b1a2362a2d78b6fcfd"
    else
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v0.10.0/actionbook-darwin-x64"
      sha256 "2bc7dd50213804d92484280f8294c9b96b1a8e982c85532ae97f95a9fe9f511f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v0.10.0/actionbook-linux-arm64"
      sha256 "69ff4950d05a31acbc9d68a36c8009d3f2cf14d99518dbd70825d4f2271445a7"
    else
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v0.10.0/actionbook-linux-x64"
      sha256 "632652a3216c1d0c7a05d4ec947db070baf6042e45450e4f069cfd14659c8350"
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
