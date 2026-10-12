class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.140"

  url "https://dl.ajna.systems/cli/0.0.140/ajna-0.0.140-linux-x86_64.tar.gz"
  sha256 "8c91650cc510321a0b0f100c90df0c7003cba0f6e499c666624d372f5c1793dc"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.140/ajna-0.0.140-darwin-arm64.tar.gz"
      sha256 "c88ae94f3a6e070a9d171c573ced60544126a0bef597692a968fcdb8c1ad0ba1"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.140/ajna-0.0.140-darwin-x86_64.tar.gz"
      sha256 "5b15f32a3fe97abef614a81f8e8ad7d16c725e4f23336d3157ff6f39df09d575"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.140/ajna-0.0.140-linux-x86_64.tar.gz"
      sha256 "8c91650cc510321a0b0f100c90df0c7003cba0f6e499c666624d372f5c1793dc"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session", "aesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
