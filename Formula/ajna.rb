class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.130"

  url "https://dl.ajna.systems/cli/0.0.130/ajna-0.0.130-linux-x86_64.tar.gz"
  sha256 "f82d94cd91dd07ef46ccc7d0527233639baa17adafff2f811110913f52dc8ae4"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.130/ajna-0.0.130-darwin-arm64.tar.gz"
      sha256 "6cdb9327b56fa1c4c2b93ea5d7dd5c10a3be73e44ea779f4424ad62adccdfbac"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.130/ajna-0.0.130-darwin-x86_64.tar.gz"
      sha256 "2759ef16a3324a000844d9c96376ea2e5e6a059bef19edb4c59cdd30c4972365"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.130/ajna-0.0.130-linux-x86_64.tar.gz"
      sha256 "f82d94cd91dd07ef46ccc7d0527233639baa17adafff2f811110913f52dc8ae4"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session", "aesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
