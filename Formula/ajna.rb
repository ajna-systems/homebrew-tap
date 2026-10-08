class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.95"

  url "https://dl.ajna.systems/cli/0.0.95/ajna-0.0.95-linux-x86_64.tar.gz"
  sha256 "46b703ec1e897d6b8bdf3b4b1b3f472b20f92bd20be858ca25929d829d682508"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.95/ajna-0.0.95-darwin-arm64.tar.gz"
      sha256 "3a10a2972435ff600e60912b37fd1a24ac1aca19f0ce654c487f4e0e1b6e5914"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.95/ajna-0.0.95-darwin-x86_64.tar.gz"
      sha256 "1693bf576790595655d6a102e5788feea025778b0440c7ed3328a2d8b378cf33"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.95/ajna-0.0.95-linux-x86_64.tar.gz"
      sha256 "46b703ec1e897d6b8bdf3b4b1b3f472b20f92bd20be858ca25929d829d682508"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
