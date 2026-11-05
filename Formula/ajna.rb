class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.155"

  url "https://dl.ajna.systems/cli/0.0.155/ajna-0.0.155-linux-x86_64.tar.gz"
  sha256 "770dd497407a2ec25aa29bf5ebd21c3a2322b6b76f86daae42bb8db230d8def8"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.155/ajna-0.0.155-darwin-arm64.tar.gz"
      sha256 "7d35518c2dcf01e2252fd63a5f97e5c20398e3c7648b2c8a0d27d42aab345516"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.155/ajna-0.0.155-darwin-x86_64.tar.gz"
      sha256 "ec7cc1bdf02d27ba5754f970ee76d3c3ffe8cfd0fc0440bf3a686e158a00465f"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.155/ajna-0.0.155-linux-x86_64.tar.gz"
      sha256 "770dd497407a2ec25aa29bf5ebd21c3a2322b6b76f86daae42bb8db230d8def8"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session", "aesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
