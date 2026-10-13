class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.141"

  url "https://dl.ajna.systems/cli/0.0.141/ajna-0.0.141-linux-x86_64.tar.gz"
  sha256 "d4acd0a01fcb9ba22ea44e6f55a966ba8f40a5aed6ede60604f35a28ebeff74f"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.141/ajna-0.0.141-darwin-arm64.tar.gz"
      sha256 "0a9fc86ce7c02cc3c0bfe5bfeb1cd345a49957816e4075f57bdaa7d41ecc92f0"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.141/ajna-0.0.141-darwin-x86_64.tar.gz"
      sha256 "f3993d3b0f2eafedf70124164b778ec474d94014d45f584462ace0c88b143195"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.141/ajna-0.0.141-linux-x86_64.tar.gz"
      sha256 "d4acd0a01fcb9ba22ea44e6f55a966ba8f40a5aed6ede60604f35a28ebeff74f"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session", "aesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
