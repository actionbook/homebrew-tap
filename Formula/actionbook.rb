# typed: false
# frozen_string_literal: true

# Formula auto-updated by actionbook/actionbook release CI.
# Manual edits will be overwritten on the next release.
class Actionbook < Formula
  desc "CLI for Actionbook - run AI actions from your terminal"
  homepage "https://actionbook.dev"
  version "1.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v1.0.2/actionbook-darwin-arm64"
      sha256 "9abf99ec96c258ae1fc0c9b885a8eba4c1c38f4c525f1992aee64a16f73250f8"
    else
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v1.0.2/actionbook-darwin-x64"
      sha256 "4a7953a4b3251a03dcc94c2e66c31b09c197afff3655019f24b5d7a6865fb0e5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v1.0.2/actionbook-linux-arm64"
      sha256 "4ea2e2d1b1afd2a05fdcb3e432635ddfece8d8a26790c9c32d875a3f44958824"
    else
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v1.0.2/actionbook-linux-x64"
      sha256 "0bbc79659440fb538b4ed2d643ef8cf8411b7c799277962537eb4da7679194ac"
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
