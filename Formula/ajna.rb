class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.96"

  url "https://dl.ajna.systems/cli/0.0.96/ajna-0.0.96-linux-x86_64.tar.gz"
  sha256 "bd0d1d82f86f5d5c06651196135835b5d88b02d833eeb0b2c31bd86d29bf9583"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.96/ajna-0.0.96-darwin-arm64.tar.gz"
      sha256 "93e3dbf9270cf1fcc26844ad1ffc7b1b4129a490520c2bda6f7941732b912ca9"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.96/ajna-0.0.96-darwin-x86_64.tar.gz"
      sha256 "32d2350d77abf5f49c44ef24eb81bcd049487247d7317a020c454dabe7f41c67"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.96/ajna-0.0.96-linux-x86_64.tar.gz"
      sha256 "bd0d1d82f86f5d5c06651196135835b5d88b02d833eeb0b2c31bd86d29bf9583"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session", "aesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
