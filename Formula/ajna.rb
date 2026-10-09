class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.99"

  url "https://dl.ajna.systems/cli/0.0.99/ajna-0.0.99-linux-x86_64.tar.gz"
  sha256 "08a7a15cc1863682fa3a6081d760fbf5f42c05c07d87d70253c4e8ceed72fe7f"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.99/ajna-0.0.99-darwin-arm64.tar.gz"
      sha256 "998fd88cb137c0a0f98123142808ae81acdf0ef83e73c16c9c78f58c536f9680"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.99/ajna-0.0.99-darwin-x86_64.tar.gz"
      sha256 "9490de6dbce09c39bd9282d45930b483ecdbfaba4b5dd85e059d2370ec9eb6e1"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.99/ajna-0.0.99-linux-x86_64.tar.gz"
      sha256 "08a7a15cc1863682fa3a6081d760fbf5f42c05c07d87d70253c4e8ceed72fe7f"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session", "aesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
