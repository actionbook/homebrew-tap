# typed: false
# frozen_string_literal: true

# Formula auto-updated by actionbook/actionbook release CI.
# Manual edits will be overwritten on the next release.
class Actionbook < Formula
  desc "CLI for Actionbook - run AI actions from your terminal"
  homepage "https://actionbook.dev"
  version "1.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v1.1.0/actionbook-darwin-arm64"
      sha256 "aad8c2a640fd44a181cdb89f9876949e7f1df27420bd0ed42f45a1deb559ec2c"
    else
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v1.1.0/actionbook-darwin-x64"
      sha256 "cec4c17478c5eceeb643a45d5cf38d1e1d4bace3adaa478a1233430f28465d8e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v1.1.0/actionbook-linux-arm64"
      sha256 "20d4e541b1788da0e5152c91002839fdd5f091ab1cd576febc989aafa5917301"
    else
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v1.1.0/actionbook-linux-x64"
      sha256 "c8bd4326a1d0dadb466753f92722efbe8923ec1e8a0bad56360d0703fb16fb33"
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
