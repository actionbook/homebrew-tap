# typed: false
# frozen_string_literal: true

# Formula auto-updated by actionbook/actionbook release CI.
# Manual edits will be overwritten on the next release.
class Actionbook < Formula
  desc "CLI for Actionbook - run AI actions from your terminal"
  homepage "https://actionbook.dev"
  version "0.11.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v0.11.7/actionbook-darwin-arm64"
      sha256 "aca3964437b830813cb9b9d85c2b07d91fc4bd758daeac566a14df06937378ab"
    else
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v0.11.7/actionbook-darwin-x64"
      sha256 "5e418edb08fc5294b6b48db4438362ed22d803caa8c8f7acedafde9a88bb4a46"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v0.11.7/actionbook-linux-arm64"
      sha256 "2be3d92104b2e3db2532ab921f6945bce459711e57fd320ec3c5e0fc1a31f8a6"
    else
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v0.11.7/actionbook-linux-x64"
      sha256 "c939a4521c658a4121e8745becf0f189809c6502f9df6950d083a3e8b69a7ead"
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
