class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.107"

  url "https://dl.ajna.systems/cli/0.0.107/ajna-0.0.107-linux-x86_64.tar.gz"
  sha256 "ca2a866fe46e7c4d91967963fb03783225e3550b292a6286bf65ea3e6e4f9021"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.107/ajna-0.0.107-darwin-arm64.tar.gz"
      sha256 "7384dddb494409cb81e082817abecf5831022f79142a7bc143841513724b11d0"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.107/ajna-0.0.107-darwin-x86_64.tar.gz"
      sha256 "42e20ab16e97ea5a8d2709756ebd14ad405a3ea1ed5d8422b7ac5d2cb576bea3"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.107/ajna-0.0.107-linux-x86_64.tar.gz"
      sha256 "ca2a866fe46e7c4d91967963fb03783225e3550b292a6286bf65ea3e6e4f9021"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session", "aesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
