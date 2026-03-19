# typed: false
# frozen_string_literal: true

# Formula auto-updated by actionbook/actionbook release CI.
# Manual edits will be overwritten on the next release.
class Actionbook < Formula
  desc "CLI for Actionbook - run AI actions from your terminal"
  homepage "https://actionbook.dev"
  version "0.10.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v0.10.1/actionbook-darwin-arm64"
      sha256 "3d02a9165c5df4732243551361fb2405565758dbbb18abae7f4152498e1510e0"
    else
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v0.10.1/actionbook-darwin-x64"
      sha256 "6d7b56ac7eb9e566216bb8d394f8adb8cbe753c73d96fb56d55561d44321f4a4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v0.10.1/actionbook-linux-arm64"
      sha256 "3c6885f05799fa0b24623312e556f970dac05cea42e9c8d93ed5958e5cd30253"
    else
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v0.10.1/actionbook-linux-x64"
      sha256 "81a0127ef054a6b10bc2136caaaeed90cbf91d2a27bb45a836411419162f2aba"
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
