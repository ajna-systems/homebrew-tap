class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.126"

  url "https://dl.ajna.systems/cli/0.0.126/ajna-0.0.126-linux-x86_64.tar.gz"
  sha256 "ae276a680afeeee2668e09d5bc029455ffab6245f76cbaa78d2685bff057255c"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.126/ajna-0.0.126-darwin-arm64.tar.gz"
      sha256 "4f3ae2ee9296ad9293d0857bb605eedb19ebf4c53f175867bae9c3360644f7ac"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.126/ajna-0.0.126-darwin-x86_64.tar.gz"
      sha256 "e2ed2e6d6563546766994391f184ceae0f3ce5a71969ab0333829cb38c41ff14"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.126/ajna-0.0.126-linux-x86_64.tar.gz"
      sha256 "ae276a680afeeee2668e09d5bc029455ffab6245f76cbaa78d2685bff057255c"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session", "aesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
