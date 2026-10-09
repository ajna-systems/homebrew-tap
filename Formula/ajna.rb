class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.97"

  url "https://dl.ajna.systems/cli/0.0.97/ajna-0.0.97-linux-x86_64.tar.gz"
  sha256 "e0e08239f137a0b53a7b7f55d5d2894e456c02759911d0ef09ae967d03aad805"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.97/ajna-0.0.97-darwin-arm64.tar.gz"
      sha256 "375d02b088d14e395843379dee414b6f1459d2f1008b5e95d119b0b48695e187"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.97/ajna-0.0.97-darwin-x86_64.tar.gz"
      sha256 "c66d89fcc42b7153096fae99c547e5fe6b0026cb7578f6652bb50637b4c02d60"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.97/ajna-0.0.97-linux-x86_64.tar.gz"
      sha256 "e0e08239f137a0b53a7b7f55d5d2894e456c02759911d0ef09ae967d03aad805"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session", "aesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
