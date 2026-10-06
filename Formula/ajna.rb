class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.92"

  url "https://dl.ajna.systems/cli/0.0.92/ajna-0.0.92-linux-x86_64.tar.gz"
  sha256 "c2893fdf6bb0d4dc1e1fe3577eccc6e3068271b7d77ebdad0d9eab8e0dbb3cc0"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.92/ajna-0.0.92-darwin-arm64.tar.gz"
      sha256 "21b127ea5757705f05d404dc18e87089b0c920e97cde640b702514430b25ffe9"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.92/ajna-0.0.92-darwin-x86_64.tar.gz"
      sha256 "22a8c2eca9ea44ab96f3b5c9f4d7f12873d69a204daf14fce023a0b8f46d96ac"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.92/ajna-0.0.92-linux-x86_64.tar.gz"
      sha256 "c2893fdf6bb0d4dc1e1fe3577eccc6e3068271b7d77ebdad0d9eab8e0dbb3cc0"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
