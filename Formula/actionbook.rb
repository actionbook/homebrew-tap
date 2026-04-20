# typed: false
# frozen_string_literal: true

# Formula auto-updated by actionbook/actionbook release CI.
# Manual edits will be overwritten on the next release.
class Actionbook < Formula
  desc "CLI for Actionbook - run AI actions from your terminal"
  homepage "https://actionbook.dev"
  version "1.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v1.5.1/actionbook-darwin-arm64"
      sha256 "bb570a30b9441912cd341cf08863000588b445ed2876b9944496c021a79043fe"
    else
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v1.5.1/actionbook-darwin-x64"
      sha256 "6c2bb0fbc1018d250468108aa5143f406eeec73fea7a9db41b1507af13021a7d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v1.5.1/actionbook-linux-arm64"
      sha256 "39d617c6477042b29e286e8638c1380c2d7a7ff2ac33844516525f8cc8c370c6"
    else
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v1.5.1/actionbook-linux-x64"
      sha256 "ad908096fd3dbb15f935c4134b5b16d85803e737bdf18780dd27b455882c3912"
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
