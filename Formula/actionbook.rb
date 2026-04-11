# typed: false
# frozen_string_literal: true

# Formula auto-updated by actionbook/actionbook release CI.
# Manual edits will be overwritten on the next release.
class Actionbook < Formula
  desc "CLI for Actionbook - run AI actions from your terminal"
  homepage "https://actionbook.dev"
  version "1.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v1.3.0/actionbook-darwin-arm64"
      sha256 "db2baaed7b9bb6881a8ca86ab74dfc0e4c6d4d84875bf08dd0763dd7f8133435"
    else
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v1.3.0/actionbook-darwin-x64"
      sha256 "5bca998951b0fed461383a81f3e461370fdcdcae5ce194dfa0e0dd99ad775867"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v1.3.0/actionbook-linux-arm64"
      sha256 "9febeb0d734942f9f4f2e1523a02d34464c57a5fcf32654ec20c5c01b4648887"
    else
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v1.3.0/actionbook-linux-x64"
      sha256 "0bddd3597c28ee20ade0167e3a837c1507bca8ace8d7fa61fee7c355d8372c5a"
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
