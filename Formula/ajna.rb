class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.138"

  url "https://dl.ajna.systems/cli/0.0.138/ajna-0.0.138-linux-x86_64.tar.gz"
  sha256 "96a6cdd8062c15377b1b831b6273cbef9c43c976f80ffc5c972975be42e80798"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.138/ajna-0.0.138-darwin-arm64.tar.gz"
      sha256 "45edc75939e30c2455913d7c55c6c095d4779a412d5fcc40f1bababfb3c891d4"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.138/ajna-0.0.138-darwin-x86_64.tar.gz"
      sha256 "e0779c73bb30f5013a35ba8d6f805a0e2d09e8dcd7a478fab235987d248e6284"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.138/ajna-0.0.138-linux-x86_64.tar.gz"
      sha256 "96a6cdd8062c15377b1b831b6273cbef9c43c976f80ffc5c972975be42e80798"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session", "aesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
