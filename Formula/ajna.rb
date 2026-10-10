class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.105"

  url "https://dl.ajna.systems/cli/0.0.105/ajna-0.0.105-linux-x86_64.tar.gz"
  sha256 "6f4692780230d7d0ef92f8d3d74095e198ef2faa864e49b0912315ecce0e226a"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.105/ajna-0.0.105-darwin-arm64.tar.gz"
      sha256 "d2c0f6fa2e0c3727030bf630698e2644fb8f2a68a3bb93cd5e4317a1297d7347"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.105/ajna-0.0.105-darwin-x86_64.tar.gz"
      sha256 "ab3622d5b7d2bc7a216acced1b57754da215c022962e2a2c518c779c53483b89"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.105/ajna-0.0.105-linux-x86_64.tar.gz"
      sha256 "6f4692780230d7d0ef92f8d3d74095e198ef2faa864e49b0912315ecce0e226a"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session", "aesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
