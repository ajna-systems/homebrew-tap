class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.84"

  url "https://dl.ajna.systems/cli/0.0.84/ajna-0.0.84-linux-x86_64.tar.gz"
  sha256 "c4506ac4f7f1adfa289e62d2dfea87c360e21bd0185dd61c497b3d8d7c504c7e"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.84/ajna-0.0.84-darwin-arm64.tar.gz"
      sha256 "8179252ba71c55434f61e5d6f7f79edbde96bd2463bc827154082dfb78fdd73e"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.84/ajna-0.0.84-darwin-x86_64.tar.gz"
      sha256 "72c261b9aa5d54567233414e90d744f86aed7e42537054a50ffb9ed246e66e7f"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.84/ajna-0.0.84-linux-x86_64.tar.gz"
      sha256 "c4506ac4f7f1adfa289e62d2dfea87c360e21bd0185dd61c497b3d8d7c504c7e"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
