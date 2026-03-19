# typed: false
# frozen_string_literal: true

# Formula auto-updated by actionbook/actionbook release CI.
# Manual edits will be overwritten on the next release.
class Actionbook < Formula
  desc "CLI for Actionbook - run AI actions from your terminal"
  homepage "https://actionbook.dev"
  version "0.11.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v0.11.1/actionbook-darwin-arm64"
      sha256 "ba153e2ec78d2499eb92310098bd0984eb59c6389be335f0d11a1d4c7e8c7b36"
    else
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v0.11.1/actionbook-darwin-x64"
      sha256 "3d464f6d9289b8459ce49a4ee63666961194350955498c55c5b011e77c0d67e6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v0.11.1/actionbook-linux-arm64"
      sha256 "9f1a6c24113dd4379f260c6ef219b8647555ff16253acf7e3bf49335fc7d8dd4"
    else
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v0.11.1/actionbook-linux-x64"
      sha256 "2fadce21a7ab446f4ab6f285665f080cbe4c9724bd98585df92a00b2d42454da"
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
