class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.110"

  url "https://dl.ajna.systems/cli/0.0.110/ajna-0.0.110-linux-x86_64.tar.gz"
  sha256 "59b08d2feabd5c5028bd9e185c5b1a78095d582e5e1baae3803988ebd025f9f7"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.110/ajna-0.0.110-darwin-arm64.tar.gz"
      sha256 "75c4ea08b99605f22e5c376e675d238cbd3cd06fe89755ad1b60990768011377"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.110/ajna-0.0.110-darwin-x86_64.tar.gz"
      sha256 "a7a623842015402904a543c75715ec116f3d3e89815c1e2dc9065342e6c795e6"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.110/ajna-0.0.110-linux-x86_64.tar.gz"
      sha256 "59b08d2feabd5c5028bd9e185c5b1a78095d582e5e1baae3803988ebd025f9f7"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session", "aesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
