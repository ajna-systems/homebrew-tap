class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.120"

  url "https://dl.ajna.systems/cli/0.0.120/ajna-0.0.120-linux-x86_64.tar.gz"
  sha256 "bec3270e9332038ebedf3734d1dfda2ed72f2d8952c5ef1ad79bba03b835aa81"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.120/ajna-0.0.120-darwin-arm64.tar.gz"
      sha256 "7f17a49f12e213480d0510d1be92a15f0ec4480f16724e93fd9d0cb8a6b56533"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.120/ajna-0.0.120-darwin-x86_64.tar.gz"
      sha256 "31550356bd6ec670a9c477e2c3ed1b2b0ea5722bb5e5f53a5d0666b3c188fe81"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.120/ajna-0.0.120-linux-x86_64.tar.gz"
      sha256 "bec3270e9332038ebedf3734d1dfda2ed72f2d8952c5ef1ad79bba03b835aa81"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session", "aesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
