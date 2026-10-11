class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.124"

  url "https://dl.ajna.systems/cli/0.0.124/ajna-0.0.124-linux-x86_64.tar.gz"
  sha256 "ef53797fa8a693cac45d580c3d49f13309341b86399d5a39aa66904f3cc83039"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.124/ajna-0.0.124-darwin-arm64.tar.gz"
      sha256 "9b22a71d52994ad5f952035aa78c9b8c5b126e9138540c9fbc80b716a707eaed"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.124/ajna-0.0.124-darwin-x86_64.tar.gz"
      sha256 "6541a915e79bce898a9c6ad9953354012f580d2dcc46836a34878b2b1bcba4c9"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.124/ajna-0.0.124-linux-x86_64.tar.gz"
      sha256 "ef53797fa8a693cac45d580c3d49f13309341b86399d5a39aa66904f3cc83039"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session", "aesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
