# typed: false
# frozen_string_literal: true

# Formula auto-updated by actionbook/actionbook release CI.
# Manual edits will be overwritten on the next release.
class Actionbook < Formula
  desc "CLI for Actionbook - run AI actions from your terminal"
  homepage "https://actionbook.dev"
  version "1.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v1.4.0/actionbook-darwin-arm64"
      sha256 "367f47d6556785af933f1970f4a1ff1addeef8aa5302aced47cb840ea26e0697"
    else
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v1.4.0/actionbook-darwin-x64"
      sha256 "4de66638c54e36e61f27f4ac7f47ccf56126aa98fa53a699d8edc25470d2d238"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v1.4.0/actionbook-linux-arm64"
      sha256 "7f394507e710d6c88b6790eaaeb7e29d188ce0b330029847ff6094f9a1295792"
    else
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v1.4.0/actionbook-linux-x64"
      sha256 "29bb00e85f3eca63a0d7b717fa54b230cf4a30694b1138a76dfe11ebebba054b"
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
