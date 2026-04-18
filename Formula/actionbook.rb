# typed: false
# frozen_string_literal: true

# Formula auto-updated by actionbook/actionbook release CI.
# Manual edits will be overwritten on the next release.
class Actionbook < Formula
  desc "CLI for Actionbook - run AI actions from your terminal"
  homepage "https://actionbook.dev"
  version "1.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v1.5.0/actionbook-darwin-arm64"
      sha256 "87179383111b358b57e86ff043bfd5bc4796d130c90f2bd6b957db1091e6d72f"
    else
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v1.5.0/actionbook-darwin-x64"
      sha256 "322930818798cda1c87730d8084710c59300cacb63350fc1ed5aa5382a8df31e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v1.5.0/actionbook-linux-arm64"
      sha256 "1af13e574be54d86f62a1d85ed933de8c36c04b6e212fd6ca667cae4eb98f4da"
    else
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v1.5.0/actionbook-linux-x64"
      sha256 "6056310e83c7754871b96722872c54dccf5ac55d8137ec7ad2ca7222b7664e23"
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
