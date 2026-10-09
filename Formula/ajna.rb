class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.98"

  url "https://dl.ajna.systems/cli/0.0.98/ajna-0.0.98-linux-x86_64.tar.gz"
  sha256 "58403d822fb1313b8a1bf5b97100cfb8e9a6511cee20a7fc1ac8838fccaad9ed"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.98/ajna-0.0.98-darwin-arm64.tar.gz"
      sha256 "8178abbccca64b795993222d3e8f3f223bef058f05cd046c93305f5292b636b6"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.98/ajna-0.0.98-darwin-x86_64.tar.gz"
      sha256 "80b8f1b8e5e7c74b963f8efc96692a97b15ef2d04e3087ae9499e1fb29780eac"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.98/ajna-0.0.98-linux-x86_64.tar.gz"
      sha256 "58403d822fb1313b8a1bf5b97100cfb8e9a6511cee20a7fc1ac8838fccaad9ed"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session", "aesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
