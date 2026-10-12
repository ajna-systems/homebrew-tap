class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.134"

  url "https://dl.ajna.systems/cli/0.0.134/ajna-0.0.134-linux-x86_64.tar.gz"
  sha256 "cac4fdd64403848b053194efd4b94a5bf0b39718037308987a381cd9d139e9ed"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.134/ajna-0.0.134-darwin-arm64.tar.gz"
      sha256 "845235d66226e01a3a0c8d7060eaa103ff19daf6d2d764417a8dfbf52300cdad"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.134/ajna-0.0.134-darwin-x86_64.tar.gz"
      sha256 "30da4cb06218c25333fe6731df587413b1e2af31f7b09f46f00b07a90639ec95"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.134/ajna-0.0.134-linux-x86_64.tar.gz"
      sha256 "cac4fdd64403848b053194efd4b94a5bf0b39718037308987a381cd9d139e9ed"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session", "aesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
