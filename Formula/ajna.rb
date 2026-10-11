class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.111"

  url "https://dl.ajna.systems/cli/0.0.111/ajna-0.0.111-linux-x86_64.tar.gz"
  sha256 "35770b3f873f04d14fdbfe1dbd97f1c6e3ab73e087cee841c238e7e4f53117dd"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.111/ajna-0.0.111-darwin-arm64.tar.gz"
      sha256 "77bf9869027a1509466bbd6a510895b07b9f85c6659dd87a4f55c3efb6c483cc"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.111/ajna-0.0.111-darwin-x86_64.tar.gz"
      sha256 "916c13fa90e65085fae8e4258c33e87ec74b5811b4512720a8dd7ef638fbda82"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.111/ajna-0.0.111-linux-x86_64.tar.gz"
      sha256 "35770b3f873f04d14fdbfe1dbd97f1c6e3ab73e087cee841c238e7e4f53117dd"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session", "aesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
