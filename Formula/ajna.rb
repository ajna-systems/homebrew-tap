class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.93"

  url "https://dl.ajna.systems/cli/0.0.93/ajna-0.0.93-linux-x86_64.tar.gz"
  sha256 "3875e0f195b1b48d294c64c2195ce2f7608d9214d110f5c3c21050410ae0431b"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.93/ajna-0.0.93-darwin-arm64.tar.gz"
      sha256 "6967a1ce3e4bd020b928524ccf5a2ff90b683fbfdb0dfd04701508d0981a84ca"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.93/ajna-0.0.93-darwin-x86_64.tar.gz"
      sha256 "44b7322df7bb86d6dcfef180c380df009ffbffe3d400f0ff807274aaeba20891"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.93/ajna-0.0.93-linux-x86_64.tar.gz"
      sha256 "3875e0f195b1b48d294c64c2195ce2f7608d9214d110f5c3c21050410ae0431b"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
