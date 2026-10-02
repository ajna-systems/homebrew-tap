class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.83"

  url "https://dl.ajna.systems/cli/0.0.83/ajna-0.0.83-linux-x86_64.tar.gz"
  sha256 "6b9abaeded518b9915c1f3da609a7939c8ddfee24d1f97be1b99b07283de9742"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.83/ajna-0.0.83-darwin-arm64.tar.gz"
      sha256 "174095bb4aa8166720848e442ceee12b46e2fef11b6ad1b885fd241146e5defa"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.83/ajna-0.0.83-darwin-x86_64.tar.gz"
      sha256 "f3c43ba71060d9d8c6e639532302143a95fc654c6e4ca624e780c551db0803f3"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.83/ajna-0.0.83-linux-x86_64.tar.gz"
      sha256 "6b9abaeded518b9915c1f3da609a7939c8ddfee24d1f97be1b99b07283de9742"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
