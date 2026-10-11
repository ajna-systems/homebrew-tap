class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.127"

  url "https://dl.ajna.systems/cli/0.0.127/ajna-0.0.127-linux-x86_64.tar.gz"
  sha256 "ba1e72cddcbe92e80793e29299e6a58ab8b36174ef82d50f6caf6e4000af5656"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.127/ajna-0.0.127-darwin-arm64.tar.gz"
      sha256 "1b5d085c317fbebba4058b652bd87628919c71ab9d88695e70b37bb67acfd8e4"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.127/ajna-0.0.127-darwin-x86_64.tar.gz"
      sha256 "4bc52a15ce63079d24701dbea86d57131f21c45c11a0145b4f6fb1cda0d39015"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.127/ajna-0.0.127-linux-x86_64.tar.gz"
      sha256 "ba1e72cddcbe92e80793e29299e6a58ab8b36174ef82d50f6caf6e4000af5656"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session", "aesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
