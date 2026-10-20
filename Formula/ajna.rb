class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.154"

  url "https://dl.ajna.systems/cli/0.0.154/ajna-0.0.154-linux-x86_64.tar.gz"
  sha256 "3261ead701e423281cb6e611872f957d6942f7b64901c5eb856bb92a20827fac"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.154/ajna-0.0.154-darwin-arm64.tar.gz"
      sha256 "b88d0c799506877685af717444324a6bae8f746c33beebd3f863ea155cb90c60"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.154/ajna-0.0.154-darwin-x86_64.tar.gz"
      sha256 "cad0b56c8cd557d30c2b21e5843f66709a8e3bcd04fd95a65b4668757564cb8a"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.154/ajna-0.0.154-linux-x86_64.tar.gz"
      sha256 "3261ead701e423281cb6e611872f957d6942f7b64901c5eb856bb92a20827fac"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session", "aesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
