class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.109"

  url "https://dl.ajna.systems/cli/0.0.109/ajna-0.0.109-linux-x86_64.tar.gz"
  sha256 "dee1e4ca16e8c1f77e9e9765bffea22a56cf4a32fc5ad6e569cfcad7769a82c9"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.109/ajna-0.0.109-darwin-arm64.tar.gz"
      sha256 "aabc01992d01fa85d4653c850f633d9e8c506a1d985a6d9cba3b2bcb2e041035"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.109/ajna-0.0.109-darwin-x86_64.tar.gz"
      sha256 "4a53bcc491b7355fc3041693912938582972a421883504b38f6db3dcc4b1404b"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.109/ajna-0.0.109-linux-x86_64.tar.gz"
      sha256 "dee1e4ca16e8c1f77e9e9765bffea22a56cf4a32fc5ad6e569cfcad7769a82c9"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session", "aesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
