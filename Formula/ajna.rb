class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.101"

  url "https://dl.ajna.systems/cli/0.0.101/ajna-0.0.101-linux-x86_64.tar.gz"
  sha256 "eca4ccde19bfd63a8afc39bb5521aa808102d2da229b7a24522cac9f1d0ad986"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.101/ajna-0.0.101-darwin-arm64.tar.gz"
      sha256 "d9359e86339509c2ef1f4d046065480f89fe626d824e0ca3a7bc6a35b28c91fb"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.101/ajna-0.0.101-darwin-x86_64.tar.gz"
      sha256 "7fa76ba1838ff7c5bb74e54c943aed327502c69ec1a1f75e518171a0b8317222"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.101/ajna-0.0.101-linux-x86_64.tar.gz"
      sha256 "eca4ccde19bfd63a8afc39bb5521aa808102d2da229b7a24522cac9f1d0ad986"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session", "aesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
