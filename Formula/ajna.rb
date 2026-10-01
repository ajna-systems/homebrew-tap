class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.81"

  url "https://dl.ajna.systems/cli/0.0.81/ajna-0.0.81-linux-x86_64.tar.gz"
  sha256 "571cf422c845e6597feb977288392ec4b52dea5959ef81740ae74dc0c46dd61c"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.81/ajna-0.0.81-darwin-arm64.tar.gz"
      sha256 "8d1ae7198a52d69987406115bcfd9b205c7179d6c4d7ded79c171e8748ce6389"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.81/ajna-0.0.81-darwin-x86_64.tar.gz"
      sha256 "ada9db86057c71471e9e0e5197f2142054ad576013c27e35b10ef5c940ab0614"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.81/ajna-0.0.81-linux-x86_64.tar.gz"
      sha256 "571cf422c845e6597feb977288392ec4b52dea5959ef81740ae74dc0c46dd61c"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
