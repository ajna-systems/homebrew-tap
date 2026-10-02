class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.82"

  url "https://dl.ajna.systems/cli/0.0.82/ajna-0.0.82-linux-x86_64.tar.gz"
  sha256 "9a785f1740780d03a449659f3b61293ab4fcca534646ec058e41e1d6e34bde3c"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.82/ajna-0.0.82-darwin-arm64.tar.gz"
      sha256 "089892366d51d8779ab466363750364aa270573003e54dc33c80a725cf741a22"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.82/ajna-0.0.82-darwin-x86_64.tar.gz"
      sha256 "c6babf12450f32253a1903c6f5c3f9be4143bc61c6f6c19d0e98af493fb6f759"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.82/ajna-0.0.82-linux-x86_64.tar.gz"
      sha256 "9a785f1740780d03a449659f3b61293ab4fcca534646ec058e41e1d6e34bde3c"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
