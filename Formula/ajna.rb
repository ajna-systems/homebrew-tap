class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.144"

  url "https://dl.ajna.systems/cli/0.0.144/ajna-0.0.144-linux-x86_64.tar.gz"
  sha256 "e90fe4450fe015d2557991c3693c0f4d84dc20f25d28b6ad636f1451986cd43e"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.144/ajna-0.0.144-darwin-arm64.tar.gz"
      sha256 "2eca720d222386fe97a5e313ad9da626c976f5ff27d3d3a07c46fc95a0c39734"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.144/ajna-0.0.144-darwin-x86_64.tar.gz"
      sha256 "2624d55b1c2d352fdb6b52f92c8993dd47d0853d02c28d23a96052cc7bdcd38d"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.144/ajna-0.0.144-linux-x86_64.tar.gz"
      sha256 "e90fe4450fe015d2557991c3693c0f4d84dc20f25d28b6ad636f1451986cd43e"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session", "aesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
