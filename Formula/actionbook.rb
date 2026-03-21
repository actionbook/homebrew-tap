# typed: false
# frozen_string_literal: true

# Formula auto-updated by actionbook/actionbook release CI.
# Manual edits will be overwritten on the next release.
class Actionbook < Formula
  desc "CLI for Actionbook - run AI actions from your terminal"
  homepage "https://actionbook.dev"
  version "0.11.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v0.11.4/actionbook-darwin-arm64"
      sha256 "bad716afc354d5fa953da970db132ddc475938000bc92db904f1080e9975f582"
    else
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v0.11.4/actionbook-darwin-x64"
      sha256 "4dcae772fb7137e99658a2381548e0b81a4836b25a9ef95b9e84eb16766f20f2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v0.11.4/actionbook-linux-arm64"
      sha256 "c37c8b41a96b2b8a71a58ff8f28215fb9e2e02132e66fa07bb09485fe4bf5f69"
    else
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v0.11.4/actionbook-linux-x64"
      sha256 "719e8e231c72c5beb45af52c056f7fb90149baeeb65d231bfb36bbd6ffe3e621"
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
