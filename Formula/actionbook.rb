# typed: false
# frozen_string_literal: true

# Formula auto-updated by actionbook/actionbook release CI.
# Manual edits will be overwritten on the next release.
class Actionbook < Formula
  desc "CLI for Actionbook - run AI actions from your terminal"
  homepage "https://actionbook.dev"
  version "1.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v1.2.0/actionbook-darwin-arm64"
      sha256 "8ce7232dc5c9dd0041759d2985418fc82450d97977f28e774f82a6acf91b466c"
    else
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v1.2.0/actionbook-darwin-x64"
      sha256 "3eb9eb71c13f236eb689723b0e44c28b75e2a5f1c226b8b1f4ce39359a79769c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v1.2.0/actionbook-linux-arm64"
      sha256 "b709b175fc15c2a55a5982dfb38f858c5be26ed08448b490adb6ccf0f6df262a"
    else
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v1.2.0/actionbook-linux-x64"
      sha256 "3ab70e3275fdbee1ca0707124d670936f1a59f3d378ed55ea39894f6aaa02c97"
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
