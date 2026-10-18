class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.149"

  url "https://dl.ajna.systems/cli/0.0.149/ajna-0.0.149-linux-x86_64.tar.gz"
  sha256 "3a4eab8a80da3b319f8540e43156cdf700f0ff8cf1f40ce8e3f6fd653229f6ef"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.149/ajna-0.0.149-darwin-arm64.tar.gz"
      sha256 "aa064f87e5be4f9524d84c30ace09784f2144658e2f3eb752f793c5d634d9201"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.149/ajna-0.0.149-darwin-x86_64.tar.gz"
      sha256 "d9d8e65bac40cb84d0ec34bcc2cd2e78c49052ebe445aa298a0443b8a0de927c"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.149/ajna-0.0.149-linux-x86_64.tar.gz"
      sha256 "3a4eab8a80da3b319f8540e43156cdf700f0ff8cf1f40ce8e3f6fd653229f6ef"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session", "aesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
