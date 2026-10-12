class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.131"

  url "https://dl.ajna.systems/cli/0.0.131/ajna-0.0.131-linux-x86_64.tar.gz"
  sha256 "1cdf418da3934e6c134e2807e40e4bae5b66e3f380cd9d82ad96d358dbddd6c2"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.131/ajna-0.0.131-darwin-arm64.tar.gz"
      sha256 "10add7577d329a8d54a64070d1b42fe605be4be62f618d6848926e82ad01e5f4"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.131/ajna-0.0.131-darwin-x86_64.tar.gz"
      sha256 "0f790f70dcb85c07b07ca9ba74c38cb12005b1669733d98d0ab008c6e9bef35c"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.131/ajna-0.0.131-linux-x86_64.tar.gz"
      sha256 "1cdf418da3934e6c134e2807e40e4bae5b66e3f380cd9d82ad96d358dbddd6c2"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session", "aesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
