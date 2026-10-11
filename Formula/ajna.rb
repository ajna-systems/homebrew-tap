class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.122"

  url "https://dl.ajna.systems/cli/0.0.122/ajna-0.0.122-linux-x86_64.tar.gz"
  sha256 "1de10eb13538037f6a0a0a10261d69059ce654e652cba34e224712e927bd7b41"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.122/ajna-0.0.122-darwin-arm64.tar.gz"
      sha256 "42c64de085a6f7fa9fb411149d0f3b09242221b6c98ff8304d5536d1ae22d04e"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.122/ajna-0.0.122-darwin-x86_64.tar.gz"
      sha256 "4fa838c2610433be7de32c2ddf11b2641d0599731253f520a8c0079aee69a051"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.122/ajna-0.0.122-linux-x86_64.tar.gz"
      sha256 "1de10eb13538037f6a0a0a10261d69059ce654e652cba34e224712e927bd7b41"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session", "aesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
