# typed: false
# frozen_string_literal: true

# Formula auto-updated by actionbook/actionbook release CI.
# Manual edits will be overwritten on the next release.
class Actionbook < Formula
  desc "CLI for Actionbook - run AI actions from your terminal"
  homepage "https://actionbook.dev"
  version "1.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v1.6.0/actionbook-darwin-arm64"
      sha256 "8969d4df6e1a21348c409acdc6a09d00f6e2bb3fd7a1377efd3d33bae79cfaa6"
    else
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v1.6.0/actionbook-darwin-x64"
      sha256 "fda54675ad45b8f99ba6340f105ef4831973489a2b101df51ac2fa0c78d832b7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v1.6.0/actionbook-linux-arm64"
      sha256 "463c32280901dd785faa2330458c6f052c68e2416227a38916e47420083a5d8a"
    else
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v1.6.0/actionbook-linux-x64"
      sha256 "056d138c768cea1c50032d772e78cff41e2a0f220137b231756c981f034438c2"
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
