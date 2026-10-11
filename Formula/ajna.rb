class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.108"

  url "https://dl.ajna.systems/cli/0.0.108/ajna-0.0.108-linux-x86_64.tar.gz"
  sha256 "3af6def1fe373f3633d6883757564421dfd015d49b86805d99700393fa2cb7cc"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.108/ajna-0.0.108-darwin-arm64.tar.gz"
      sha256 "1214876df73816906fbe751726adb00a089e51b93e9775793cb562bc514820e4"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.108/ajna-0.0.108-darwin-x86_64.tar.gz"
      sha256 "e75cec60db907013d3bfeb88b856833789cc6adf90f3f4ec7933d7056f3a2253"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.108/ajna-0.0.108-linux-x86_64.tar.gz"
      sha256 "3af6def1fe373f3633d6883757564421dfd015d49b86805d99700393fa2cb7cc"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session", "aesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
