class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.137"

  url "https://dl.ajna.systems/cli/0.0.137/ajna-0.0.137-linux-x86_64.tar.gz"
  sha256 "fee2043bd3d45083de10c86d3c033884c8ca8cb326f913fcd5e616d6e5a9dcdd"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.137/ajna-0.0.137-darwin-arm64.tar.gz"
      sha256 "09e259806dda9cdf93e589832f099c085d856894d05fb80c44c4e3a9d8d4d05e"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.137/ajna-0.0.137-darwin-x86_64.tar.gz"
      sha256 "1880688080998f1f23c39c117c20956bafe50a8b8c9d5e03ca8115f98d17a297"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.137/ajna-0.0.137-linux-x86_64.tar.gz"
      sha256 "fee2043bd3d45083de10c86d3c033884c8ca8cb326f913fcd5e616d6e5a9dcdd"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session", "aesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
