class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.100"

  url "https://dl.ajna.systems/cli/0.0.100/ajna-0.0.100-linux-x86_64.tar.gz"
  sha256 "4b1fe6f7a03735abf41a15fff3d7174fdb3d26342d8c2ae06964bd23617e2c44"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.100/ajna-0.0.100-darwin-arm64.tar.gz"
      sha256 "322cd9f821124a1b466719cd9dd113ee1e99b3abaef2d8a34645dd1a7be866a4"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.100/ajna-0.0.100-darwin-x86_64.tar.gz"
      sha256 "acb8aa62eaa0fd8d40bd8eef39277187a0bdb66e4ae4e48623ef8229a649481a"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.100/ajna-0.0.100-linux-x86_64.tar.gz"
      sha256 "4b1fe6f7a03735abf41a15fff3d7174fdb3d26342d8c2ae06964bd23617e2c44"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session", "aesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
