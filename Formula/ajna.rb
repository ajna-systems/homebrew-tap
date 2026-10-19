class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.153"

  url "https://dl.ajna.systems/cli/0.0.153/ajna-0.0.153-linux-x86_64.tar.gz"
  sha256 "ecd0b17fe61e0184c34300e805fb088aee1c34e9f4e4f5cd5ccb9d0c334d3d9b"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.153/ajna-0.0.153-darwin-arm64.tar.gz"
      sha256 "b3a70995c58a8c5100b5e95fb0ee715416c9aa9ef34c573bb49463e4a47d9f74"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.153/ajna-0.0.153-darwin-x86_64.tar.gz"
      sha256 "092dfed20ccff87d1b7d48908c37e123c8a710da0b2b9e7202161c971bd6cd43"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.153/ajna-0.0.153-linux-x86_64.tar.gz"
      sha256 "ecd0b17fe61e0184c34300e805fb088aee1c34e9f4e4f5cd5ccb9d0c334d3d9b"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session", "aesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
