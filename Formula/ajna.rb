class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.114"

  url "https://dl.ajna.systems/cli/0.0.114/ajna-0.0.114-linux-x86_64.tar.gz"
  sha256 "3e5e652ea10a97b095a7a0c9165f5ad417b25bcf3ba4c7f9a98192807f9466c3"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.114/ajna-0.0.114-darwin-arm64.tar.gz"
      sha256 "1ae5914644eadac20976d40a022b263843c540dcb75763da691e5910c52e465f"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.114/ajna-0.0.114-darwin-x86_64.tar.gz"
      sha256 "edbb9241099f2182a40bcc80174ff22116cbd5d8489aa9f87279927f1aa91e50"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.114/ajna-0.0.114-linux-x86_64.tar.gz"
      sha256 "3e5e652ea10a97b095a7a0c9165f5ad417b25bcf3ba4c7f9a98192807f9466c3"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session", "aesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
