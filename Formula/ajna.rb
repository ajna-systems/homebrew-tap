class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.135"

  url "https://dl.ajna.systems/cli/0.0.135/ajna-0.0.135-linux-x86_64.tar.gz"
  sha256 "5804d27d0aa514ee9914b1a34edfaebf422ba750502572eb3c7d7d7a8df1aa0b"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.135/ajna-0.0.135-darwin-arm64.tar.gz"
      sha256 "05270883f609849df083498f8f22c9d6d5b6aa2275440af40019238658584e3b"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.135/ajna-0.0.135-darwin-x86_64.tar.gz"
      sha256 "88c7feec6a304d38f18aad41d794ec417c1a493d81f3c5f6de62a49e2330359b"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.135/ajna-0.0.135-linux-x86_64.tar.gz"
      sha256 "5804d27d0aa514ee9914b1a34edfaebf422ba750502572eb3c7d7d7a8df1aa0b"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session", "aesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
