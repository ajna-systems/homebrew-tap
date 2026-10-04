class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.85"

  url "https://dl.ajna.systems/cli/0.0.85/ajna-0.0.85-linux-x86_64.tar.gz"
  sha256 "ec40fd3c74df24ad869792eb056dbcc51eeb26638bd2ac6449cce5d7ad82cd76"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.85/ajna-0.0.85-darwin-arm64.tar.gz"
      sha256 "ddc79586ae6ff1a9cfe9ccbf3d5ed345c3ab720336e64074d7fad9a2e81fbc59"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.85/ajna-0.0.85-darwin-x86_64.tar.gz"
      sha256 "7caf0815502d009b36a8f5fe25779d0274e8e0f6200f7919c4a061c0e2a27fd9"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.85/ajna-0.0.85-linux-x86_64.tar.gz"
      sha256 "ec40fd3c74df24ad869792eb056dbcc51eeb26638bd2ac6449cce5d7ad82cd76"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
