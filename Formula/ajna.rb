class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.132"

  url "https://dl.ajna.systems/cli/0.0.132/ajna-0.0.132-linux-x86_64.tar.gz"
  sha256 "8f723c94d2ad6728b197e3a56d00ba3410fc7d3d85311054ed3ae8a3c01cd9b5"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.132/ajna-0.0.132-darwin-arm64.tar.gz"
      sha256 "e8f58c85b4f1bba2e6146a84698eaba78e75b635f0a6cea3d285068113cfa4a5"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.132/ajna-0.0.132-darwin-x86_64.tar.gz"
      sha256 "ab4416ae137e6d34a6395c7ed907d134f8014e5cc91a90b1755d8a26de1b8d72"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.132/ajna-0.0.132-linux-x86_64.tar.gz"
      sha256 "8f723c94d2ad6728b197e3a56d00ba3410fc7d3d85311054ed3ae8a3c01cd9b5"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session", "aesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
