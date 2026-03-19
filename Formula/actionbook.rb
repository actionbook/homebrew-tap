# typed: false
# frozen_string_literal: true

# Formula auto-updated by actionbook/actionbook release CI.
# Manual edits will be overwritten on the next release.
class Actionbook < Formula
  desc "CLI for Actionbook - run AI actions from your terminal"
  homepage "https://actionbook.dev"
  version "0.11.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v0.11.2/actionbook-darwin-arm64"
      sha256 "d51d2c30ae3a8a32093945f2e28b998fd42b2183d5765abf0d01c97b5c748bc7"
    else
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v0.11.2/actionbook-darwin-x64"
      sha256 "7f063c798890c645931872e51bd58a0fbab477cd2adb1ffb94826816b8c1cb65"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v0.11.2/actionbook-linux-arm64"
      sha256 "99d8a8531941368b1b362f55c97942a8fc02edd3d227c7f429d6f7e0d97ea0d9"
    else
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v0.11.2/actionbook-linux-x64"
      sha256 "6669590fbd40e8989a24f70d2eaf31e765bb4073a24b73da87bb0bfbe5e69f69"
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
