class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.151"

  url "https://dl.ajna.systems/cli/0.0.151/ajna-0.0.151-linux-x86_64.tar.gz"
  sha256 "69826891177ea07b8d3575f5ada20957b039b2874fea9361a13660a133eaceee"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.151/ajna-0.0.151-darwin-arm64.tar.gz"
      sha256 "413254d3ba7b84643a0cccae7e514ecfb490a019ccfd5b3e1efa44dec38f2dec"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.151/ajna-0.0.151-darwin-x86_64.tar.gz"
      sha256 "a7de1ca5662c77734089909837153bd11e253341fb6eb2d9f97ae7c39256df62"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.151/ajna-0.0.151-linux-x86_64.tar.gz"
      sha256 "69826891177ea07b8d3575f5ada20957b039b2874fea9361a13660a133eaceee"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session", "aesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
