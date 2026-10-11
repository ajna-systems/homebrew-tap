class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.121"

  url "https://dl.ajna.systems/cli/0.0.121/ajna-0.0.121-linux-x86_64.tar.gz"
  sha256 "9e6b6e4f6abb05155a55fa5a25792002d6047ef2d8d5d3d091f502562968dfb1"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.121/ajna-0.0.121-darwin-arm64.tar.gz"
      sha256 "580fc7cd5a1689e112697d291ab60b69d36a76dbded7d8a52f3132d7a086e636"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.121/ajna-0.0.121-darwin-x86_64.tar.gz"
      sha256 "7fe0fbf304918859688958e3fdcf2195ef4d4357369445766e821569b55750bd"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.121/ajna-0.0.121-linux-x86_64.tar.gz"
      sha256 "9e6b6e4f6abb05155a55fa5a25792002d6047ef2d8d5d3d091f502562968dfb1"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session", "aesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
