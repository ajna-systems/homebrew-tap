class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.103"

  url "https://dl.ajna.systems/cli/0.0.103/ajna-0.0.103-linux-x86_64.tar.gz"
  sha256 "266f3c390ece1363acd7aa3eee174191c12d628ffbf4591566b3acf55f9ead21"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.103/ajna-0.0.103-darwin-arm64.tar.gz"
      sha256 "8ae59a87f2f1c5182840cfde8841f98e2e82ff4e4086c77dd060f5a6737625ca"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.103/ajna-0.0.103-darwin-x86_64.tar.gz"
      sha256 "d8a466474760ddd16c07db5b2a80fc265b18a0976f7092c709ca28146349f75a"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.103/ajna-0.0.103-linux-x86_64.tar.gz"
      sha256 "266f3c390ece1363acd7aa3eee174191c12d628ffbf4591566b3acf55f9ead21"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session", "aesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
