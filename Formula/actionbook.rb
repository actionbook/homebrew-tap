# typed: false
# frozen_string_literal: true

# Formula auto-updated by actionbook/actionbook release CI.
# Manual edits will be overwritten on the next release.
class Actionbook < Formula
  desc "CLI for Actionbook - run AI actions from your terminal"
  homepage "https://actionbook.dev"
  version "1.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v1.0.1/actionbook-darwin-arm64"
      sha256 "11b5f71633fa44503758fc4a27679ef777ae18b5de138e66501dd438d558b475"
    else
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v1.0.1/actionbook-darwin-x64"
      sha256 "11ec054c32953af497cdd7785a7f77d1157247f6f515510b9a5f6a317e0411fd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v1.0.1/actionbook-linux-arm64"
      sha256 "19e48e27f96233caf3d9a31102322280109e4e6aa2a870f7fbea9c05be2e2640"
    else
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v1.0.1/actionbook-linux-x64"
      sha256 "00f4110bb2420a89670730a0617c1ee73b2fe68a08608a47b1cc7ebb1568489b"
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
