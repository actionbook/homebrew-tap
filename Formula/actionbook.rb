# typed: false
# frozen_string_literal: true

# Formula auto-updated by actionbook/actionbook release CI.
# Manual edits will be overwritten on the next release.
class Actionbook < Formula
  desc "CLI for Actionbook - run AI actions from your terminal"
  homepage "https://actionbook.dev"
  version "1.4.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v1.4.3/actionbook-darwin-arm64"
      sha256 "cf95ac1a453dd6adc9cb1e457fad5cbcf62e795db78899498f30eedec21b3f46"
    else
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v1.4.3/actionbook-darwin-x64"
      sha256 "251e1c2b92f76fca54438edf4b8f72512b932b4fc47743c601f31bf1da5babb5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v1.4.3/actionbook-linux-arm64"
      sha256 "aa63b498137e6a388536a005bda3399cf112e7f9f42cf9dd1801fb1c900def52"
    else
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v1.4.3/actionbook-linux-x64"
      sha256 "85196fdcf69795e641a3ad9f498143a2cdc5e76d7e40c9d0317bcee4348340a9"
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
