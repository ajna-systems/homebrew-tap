class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.86"

  url "https://dl.ajna.systems/cli/0.0.86/ajna-0.0.86-linux-x86_64.tar.gz"
  sha256 "ebed1aadc70cfc117d4f1d86e47b15b4da0c2e953e7727e948641f4386080b4e"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.86/ajna-0.0.86-darwin-arm64.tar.gz"
      sha256 "873e9691dcfdaa19d334dac5bc81121d2c9f46a3a728248ac56093d04c63221d"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.86/ajna-0.0.86-darwin-x86_64.tar.gz"
      sha256 "87892ccb31f3f9a5020ca0fccc8cef4b67b0a069b1cd88c6c9361d29c45d4fcb"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.86/ajna-0.0.86-linux-x86_64.tar.gz"
      sha256 "ebed1aadc70cfc117d4f1d86e47b15b4da0c2e953e7727e948641f4386080b4e"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
