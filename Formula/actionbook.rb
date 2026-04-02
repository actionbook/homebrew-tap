# typed: false
# frozen_string_literal: true

# Formula auto-updated by actionbook/actionbook release CI.
# Manual edits will be overwritten on the next release.
class Actionbook < Formula
  desc "CLI for Actionbook - run AI actions from your terminal"
  homepage "https://actionbook.dev"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v1.0.0/actionbook-darwin-arm64"
      sha256 "e8a7ffcc69bb867f1471f3cf6c11f829dc48bfe7ea5db9517b62207272f90be3"
    else
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v1.0.0/actionbook-darwin-x64"
      sha256 "4e9776d37e37f7d5bb5eebb7e16d75a29f886fa9686f1cdf55b2176b6032a25a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v1.0.0/actionbook-linux-arm64"
      sha256 "8d93b54fc7ee1a1285649ccf1dbd9973a08ede13ec9036e3cc750aa0e144d5e3"
    else
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v1.0.0/actionbook-linux-x64"
      sha256 "f2373846f9fe1bb964d7af77dd7c2c8f410ac7801b3c5934bfac3b8c958eb840"
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
