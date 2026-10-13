class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.142"

  url "https://dl.ajna.systems/cli/0.0.142/ajna-0.0.142-linux-x86_64.tar.gz"
  sha256 "c2187abae69f4c9a5d1e79f68a90091996366605d8f985211c6771c67f284ed5"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.142/ajna-0.0.142-darwin-arm64.tar.gz"
      sha256 "8a2c151a3836414ea8e6204e749f843565c18f15f632d4d4d3b9963e4f6f3b2c"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.142/ajna-0.0.142-darwin-x86_64.tar.gz"
      sha256 "e2c4d7d2a3974a72c9e0512a32fcfe507f4343cb2bf52bb5104318dcd6485d4d"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.142/ajna-0.0.142-linux-x86_64.tar.gz"
      sha256 "c2187abae69f4c9a5d1e79f68a90091996366605d8f985211c6771c67f284ed5"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session", "aesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
