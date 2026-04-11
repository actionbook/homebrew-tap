# typed: false
# frozen_string_literal: true

# Formula auto-updated by actionbook/actionbook release CI.
# Manual edits will be overwritten on the next release.
class Actionbook < Formula
  desc "CLI for Actionbook - run AI actions from your terminal"
  homepage "https://actionbook.dev"
  version "1.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v1.3.1/actionbook-darwin-arm64"
      sha256 "c65572722ec44918ce51e3c5c95f460f49928f9188f1124debc1934a24689008"
    else
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v1.3.1/actionbook-darwin-x64"
      sha256 "036d745debe640c8af2fe365c853041746ba49ad3c90c01369e919bccab0e46c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v1.3.1/actionbook-linux-arm64"
      sha256 "2d27a92510acf5783bf8c010adf5e7ea68d750e16190653164fe11412b376e1a"
    else
      url "https://github.com/actionbook/actionbook/releases/download/actionbook-cli-v1.3.1/actionbook-linux-x64"
      sha256 "1d78c94e8f9a3623c753c3778a0153f4cebdcb83348fbc860e159527b3d86d72"
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
