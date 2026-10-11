class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.128"

  url "https://dl.ajna.systems/cli/0.0.128/ajna-0.0.128-linux-x86_64.tar.gz"
  sha256 "1887e380c62d81b708ade40dce6aa0662f7cf94147b3e3ff6292073d187ba2df"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.128/ajna-0.0.128-darwin-arm64.tar.gz"
      sha256 "ed97214a5bdb1029fe50c41876383f30ac712365f0163a9cfe221d3125383036"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.128/ajna-0.0.128-darwin-x86_64.tar.gz"
      sha256 "a9ea28cf3d0fd707a9d68b866e8fe91ec7446e6780b6da3a93002ae75c67b998"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.128/ajna-0.0.128-linux-x86_64.tar.gz"
      sha256 "1887e380c62d81b708ade40dce6aa0662f7cf94147b3e3ff6292073d187ba2df"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session", "aesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
