# typed: false
# frozen_string_literal: true

# Formula auto-updated by actionbook/actionbook release CI.
# Manual edits will be overwritten on the next release.
class Actionbook < Formula
  desc "CLI for Actionbook – run AI actions from your terminal"
  homepage "https://actionbook.dev"
  version "0.8.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v#{version}/actionbook-darwin-arm64"
      sha256 "843249d4f01f9cd256b719029f86d3c92157af2b62f4c3c26896ff4c4223ca01"
    else
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v#{version}/actionbook-darwin-x64"
      sha256 "15570452c44dc976b7f8508f3231cc658e0f4d0c6f5905e968beee3c85e93ab0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v#{version}/actionbook-linux-arm64"
      sha256 "7f18ab91e2749e76167810b4aa9ab4e2f95ec60b920f09ab848bea738513bf6b"
    else
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v#{version}/actionbook-linux-x64"
      sha256 "c7437e5f70bde836b908da61b0603d0eb908cfcf97d6d64aab61c9c3f7bafe7f"
    end
  end

  def install
    binary_name = "actionbook"
    # The download is a single prebuilt binary (no archive)
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
