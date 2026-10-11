class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.118"

  url "https://dl.ajna.systems/cli/0.0.118/ajna-0.0.118-linux-x86_64.tar.gz"
  sha256 "0580ad43d104a55251c23a63bf636f5617ba647c6131f85b87367fcd088a648c"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.118/ajna-0.0.118-darwin-arm64.tar.gz"
      sha256 "e711f2f2f96df22de0cf8f10cdd4aabeea5bdf67f400c8e1d3e38d8f423a96f5"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.118/ajna-0.0.118-darwin-x86_64.tar.gz"
      sha256 "c88cce8782b8b32c8c6b107c64007850fd9cce5199701feb54ef11fc6d05f14a"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.118/ajna-0.0.118-linux-x86_64.tar.gz"
      sha256 "0580ad43d104a55251c23a63bf636f5617ba647c6131f85b87367fcd088a648c"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session", "aesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
