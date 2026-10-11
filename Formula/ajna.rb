class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.117"

  url "https://dl.ajna.systems/cli/0.0.117/ajna-0.0.117-linux-x86_64.tar.gz"
  sha256 "e7d71b5d95691c5aab2fb0ca3dd6cd58957d8038a3f668c3b49f1c3ed1c6b4b0"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.117/ajna-0.0.117-darwin-arm64.tar.gz"
      sha256 "c405ab5daacdc80b54be5c32093edb9e92dfca1e78096c66b3bd6b47bd5c47d9"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.117/ajna-0.0.117-darwin-x86_64.tar.gz"
      sha256 "cb237385f6ba3855b9102f0a25907a477de00b40c575af7ecc0e813531cd1b2e"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.117/ajna-0.0.117-linux-x86_64.tar.gz"
      sha256 "e7d71b5d95691c5aab2fb0ca3dd6cd58957d8038a3f668c3b49f1c3ed1c6b4b0"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session", "aesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
