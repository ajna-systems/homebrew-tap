class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.150"

  url "https://dl.ajna.systems/cli/0.0.150/ajna-0.0.150-linux-x86_64.tar.gz"
  sha256 "3e4f12ec9900b701bd25cacf9045435afdd59872a3c5d5325b6fe77661821d1a"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.150/ajna-0.0.150-darwin-arm64.tar.gz"
      sha256 "74d910c78e161954ea2f39f4e7e81ec678712768847ba0638311f3c536ccfa48"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.150/ajna-0.0.150-darwin-x86_64.tar.gz"
      sha256 "fdf0817b436fbecc82b78591c12d6febe406be7e27ffd44cf6ccd8422ecce9c9"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.150/ajna-0.0.150-linux-x86_64.tar.gz"
      sha256 "3e4f12ec9900b701bd25cacf9045435afdd59872a3c5d5325b6fe77661821d1a"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session", "aesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
