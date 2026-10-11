class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.123"

  url "https://dl.ajna.systems/cli/0.0.123/ajna-0.0.123-linux-x86_64.tar.gz"
  sha256 "33f527aba08fd7956ae0a280f28f99fb454178e83473400d637467c2122c7388"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.123/ajna-0.0.123-darwin-arm64.tar.gz"
      sha256 "943d9e528ba632a811a44e8ea4f982e66d5dfdf4ee9252ede5b4353e7c4dcaf8"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.123/ajna-0.0.123-darwin-x86_64.tar.gz"
      sha256 "5072c79594bc10be76fed5c13e38c06a1874b1caeef3b29bbd50a12c78c1b8f3"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.123/ajna-0.0.123-linux-x86_64.tar.gz"
      sha256 "33f527aba08fd7956ae0a280f28f99fb454178e83473400d637467c2122c7388"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session", "aesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
