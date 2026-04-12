# typed: false
# frozen_string_literal: true

# Formula auto-updated by actionbook/actionbook release CI.
# Manual edits will be overwritten on the next release.
class Actionbook < Formula
  desc "CLI for Actionbook - run AI actions from your terminal"
  homepage "https://actionbook.dev"
  version "1.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v1.4.1/actionbook-darwin-arm64"
      sha256 "c90ae23d8795f9b2840fb99a23051323d19f51a214d77fcd8356556294d62466"
    else
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v1.4.1/actionbook-darwin-x64"
      sha256 "fcec1a3de9befcdd5bb3a426ab2044ea9a2e20fe36b2c1b7b3ee7dca18bd8f27"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v1.4.1/actionbook-linux-arm64"
      sha256 "7e36c75d71ab3816dcd072e9ecdd6c127c2a5cf26d4ac9c30eb38cf41cf8db06"
    else
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v1.4.1/actionbook-linux-x64"
      sha256 "be2971773d5af00427f4abe56b3d367a1b47a7d0928f01a56f428d1ba027a677"
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
