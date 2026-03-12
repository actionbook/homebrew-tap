# typed: false
# frozen_string_literal: true

# Formula auto-updated by actionbook/actionbook release CI.
# Manual edits will be overwritten on the next release.
class Actionbook < Formula
  desc "CLI for Actionbook - run AI actions from your terminal"
  homepage "https://actionbook.dev"
  version "0.9.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v0.9.2/actionbook-darwin-arm64"
      sha256 "bcc58c9fcc29c06ec0049f206251a32cba313a831acc5e861eec9d5d32bcb4a8"
    else
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v0.9.2/actionbook-darwin-x64"
      sha256 "bc54692d73fbf092c6009c8b31ac9a1f0f85e4affbcdc816df62c72a8e857341"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v0.9.2/actionbook-linux-arm64"
      sha256 "74b3c5912eb114b8c05ce40b2d1745e2ae3efbdde4cf2fa1f8f38fa81c217db3"
    else
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v0.9.2/actionbook-linux-x64"
      sha256 "b147a4f1b69dcfc0df3513246816a79d34a08c70503eb25e075be9d1d8b5bf49"
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
