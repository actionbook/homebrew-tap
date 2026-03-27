# typed: false
# frozen_string_literal: true

# Formula auto-updated by actionbook/actionbook release CI.
# Manual edits will be overwritten on the next release.
class Actionbook < Formula
  desc "CLI for Actionbook - run AI actions from your terminal"
  homepage "https://actionbook.dev"
  version "0.11.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v0.11.6/actionbook-darwin-arm64"
      sha256 "cbf4e0a42567484993b00d1368eadaf422fa6b76b57d43c194b9ccd46fc8e648"
    else
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v0.11.6/actionbook-darwin-x64"
      sha256 "8cf529486f19a56900969aee41181c81a752c4e6d194d45dc8c951bdaed8a0b1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v0.11.6/actionbook-linux-arm64"
      sha256 "32be1c95b70147fd8c2f825b169f42c9a18d5b698296bf030c94686e7cb4190c"
    else
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v0.11.6/actionbook-linux-x64"
      sha256 "6f53a1bc50400ea21cf8561551d5e5d645b54808211445c7083edc655690b94c"
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
