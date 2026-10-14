class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.147"

  url "https://dl.ajna.systems/cli/0.0.147/ajna-0.0.147-linux-x86_64.tar.gz"
  sha256 "e211a4c4a058563c74fb932789aed2e553c216569f3419d7cad8210d17e0be2c"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.147/ajna-0.0.147-darwin-arm64.tar.gz"
      sha256 "db520056e868f8b104a997c81875fd56f3162aa90f4a14f7b62ac88ca6951d75"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.147/ajna-0.0.147-darwin-x86_64.tar.gz"
      sha256 "d8211a38f22be3cfa862f955a45ef17a72b5c0dd14ad13c8a8f0fe801ff47be9"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.147/ajna-0.0.147-linux-x86_64.tar.gz"
      sha256 "e211a4c4a058563c74fb932789aed2e553c216569f3419d7cad8210d17e0be2c"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session", "aesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
