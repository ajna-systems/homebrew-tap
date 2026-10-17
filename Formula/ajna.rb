class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.148"

  url "https://dl.ajna.systems/cli/0.0.148/ajna-0.0.148-linux-x86_64.tar.gz"
  sha256 "0615684e1929be952fa31b2e78865e4471310d1718f3f2537290b471a5d859ed"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.148/ajna-0.0.148-darwin-arm64.tar.gz"
      sha256 "8644540feae715b51b270b01a7caf547d2cd5ca9785eac56fa9daaa81d969f43"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.148/ajna-0.0.148-darwin-x86_64.tar.gz"
      sha256 "a0b8f3c7e07782b9ecd91248f4df8f763e4891468223d68a79de21419617567a"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.148/ajna-0.0.148-linux-x86_64.tar.gz"
      sha256 "0615684e1929be952fa31b2e78865e4471310d1718f3f2537290b471a5d859ed"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session", "aesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
