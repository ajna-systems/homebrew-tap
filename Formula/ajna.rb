class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.91"

  url "https://dl.ajna.systems/cli/0.0.91/ajna-0.0.91-linux-x86_64.tar.gz"
  sha256 "e16d6cb9f8a8af4dca72d4aa01263677872a6cd3c592344e3c3378b0f584d217"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.91/ajna-0.0.91-darwin-arm64.tar.gz"
      sha256 "5cc0d4f231d06882abc968d4fd9536800f667c970512b756b1c97fb4a9c2b5e2"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.91/ajna-0.0.91-darwin-x86_64.tar.gz"
      sha256 "d25a9b6bab5c16d32340149e60eb6955d936e7d036a72325bc7bb118a0aeac05"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.91/ajna-0.0.91-linux-x86_64.tar.gz"
      sha256 "e16d6cb9f8a8af4dca72d4aa01263677872a6cd3c592344e3c3378b0f584d217"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
