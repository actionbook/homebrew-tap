# typed: false
# frozen_string_literal: true

# Formula auto-updated by actionbook/actionbook release CI.
# Manual edits will be overwritten on the next release.
class Actionbook < Formula
  desc "CLI for Actionbook - run AI actions from your terminal"
  homepage "https://actionbook.dev"
  version "0.9.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v0.9.1/actionbook-darwin-arm64"
      sha256 "16d54795c0c774747ba42db147c90790d3910cb9701a853c5ba95cfd3d7e407a"
    else
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v0.9.1/actionbook-darwin-x64"
      sha256 "ae366aedfb1dedcfe69b57e3c8648bb5d060016c3583a90e18f0b261bf583fb9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v0.9.1/actionbook-linux-arm64"
      sha256 "763759b42e41fb493f4654aff0f0d64b75b906bfc754577420b8b500cc26202c"
    else
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v0.9.1/actionbook-linux-x64"
      sha256 "741aaed698f1c9d9ff93c50b20df32297ae3ca930aafbccd65cd0bb9793c25cd"
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
