class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.146"

  url "https://dl.ajna.systems/cli/0.0.146/ajna-0.0.146-linux-x86_64.tar.gz"
  sha256 "3de0fd98730901a8e78d530d63f44904f606ae5cf0c7dc35b483c64bbcc6d5c1"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.146/ajna-0.0.146-darwin-arm64.tar.gz"
      sha256 "4d1a80fa25de84c206c35124a438d31202e714b1f5482acc0bd4403ce0d672c9"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.146/ajna-0.0.146-darwin-x86_64.tar.gz"
      sha256 "c63a0695bc7406246ba87960069c3756381e65a2cc62ca7a3cee724105672659"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.146/ajna-0.0.146-linux-x86_64.tar.gz"
      sha256 "3de0fd98730901a8e78d530d63f44904f606ae5cf0c7dc35b483c64bbcc6d5c1"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session", "aesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
