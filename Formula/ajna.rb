class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.94"

  url "https://dl.ajna.systems/cli/0.0.94/ajna-0.0.94-linux-x86_64.tar.gz"
  sha256 "4a34f383d43fc65c7bab1e8387aefa6086b6d5f5b044984af1aea90628a7740b"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.94/ajna-0.0.94-darwin-arm64.tar.gz"
      sha256 "1c7bdcf4e9c94b2969a95bd98dee9c44ba5ffaaca67de26c81629f4fde93b36f"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.94/ajna-0.0.94-darwin-x86_64.tar.gz"
      sha256 "ec799633572819b634a1c60b729b4c66f0e9d861267694e85fb2da96c0abb119"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.94/ajna-0.0.94-linux-x86_64.tar.gz"
      sha256 "4a34f383d43fc65c7bab1e8387aefa6086b6d5f5b044984af1aea90628a7740b"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
