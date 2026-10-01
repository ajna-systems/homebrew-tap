class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.80"

  url "https://dl.ajna.systems/cli/0.0.80/ajna-0.0.80-linux-x86_64.tar.gz"
  sha256 "35a12fc9fbd907dd4b5a61a4e89755b305b565207eff0ab5c75158f1ddcd6346"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.80/ajna-0.0.80-darwin-arm64.tar.gz"
      sha256 "36b44c23896bc67cf3888445a8f0d5d2805f7d5f539ce8615360f6edb0a391c8"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.80/ajna-0.0.80-darwin-x86_64.tar.gz"
      sha256 "cb78ed0927fcd561528b840ec8e617371a202e1a14744332634fb23fccff5283"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.80/ajna-0.0.80-linux-x86_64.tar.gz"
      sha256 "35a12fc9fbd907dd4b5a61a4e89755b305b565207eff0ab5c75158f1ddcd6346"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
