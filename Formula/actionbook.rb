# typed: false
# frozen_string_literal: true

# Formula auto-updated by actionbook/actionbook release CI.
# Manual edits will be overwritten on the next release.
class Actionbook < Formula
  desc "CLI for Actionbook - run AI actions from your terminal"
  homepage "https://actionbook.dev"
  version "1.4.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v1.4.2/actionbook-darwin-arm64"
      sha256 "5949319acc5416158085cd1ae40c674809f2d61a4e258870af7d77e53bf16ab7"
    else
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v1.4.2/actionbook-darwin-x64"
      sha256 "c769094611116109e15cc11d50c1f86669ad6a0ccb17635d1cc501ab38db682d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v1.4.2/actionbook-linux-arm64"
      sha256 "55c7e36368e84977997acaffedeef696d6f290e3881af9c27fd11dee6a9e897b"
    else
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v1.4.2/actionbook-linux-x64"
      sha256 "41ca95762c809b2f1e616e8f26906e48d40311a0a0b9badca8ce86c5aad37e1a"
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
