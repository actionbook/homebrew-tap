# typed: false
# frozen_string_literal: true

# Formula auto-updated by actionbook/actionbook release CI.
# Manual edits will be overwritten on the next release.
class Actionbook < Formula
  desc "CLI for Actionbook - run AI actions from your terminal"
  homepage "https://actionbook.dev"
  version "1.5.0-alpha.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v1.5.0-alpha.1/actionbook-darwin-arm64"
      sha256 "f34b7b23799a5850ed4b3a4b20596b3c2499a9c5d1df6d03bcff76ddc4db5908"
    else
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v1.5.0-alpha.1/actionbook-darwin-x64"
      sha256 "b9c575611c0ea780a87abd4cf6e84b91dd2a01613444bbb0d99a365292c0c61a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v1.5.0-alpha.1/actionbook-linux-arm64"
      sha256 "50fcfa0cc5195c9ddd6d975a009fdf86fd9af76a30b6b1dbb14fe1bd4e1a274d"
    else
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v1.5.0-alpha.1/actionbook-linux-x64"
      sha256 "2b8a178c955388b368a20779d8a9c075296268801164e2b2ca4ab38c8f39ca9c"
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
