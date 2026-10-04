class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.87"

  url "https://dl.ajna.systems/cli/0.0.87/ajna-0.0.87-linux-x86_64.tar.gz"
  sha256 "ec6008ed458fb810bc56c8faa8a8f287b624573f571bcb1d53a7d7f6ce68bc81"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.87/ajna-0.0.87-darwin-arm64.tar.gz"
      sha256 "d571cb1c2fd5b40a9116310a6f0c2a350d4f5a0c3edeb7cc9860dd00219cd01a"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.87/ajna-0.0.87-darwin-x86_64.tar.gz"
      sha256 "769e77de1f2b21cd7d6211f7702f40dd18da3f9141a5c59e23d6d8ba4b96a92f"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.87/ajna-0.0.87-linux-x86_64.tar.gz"
      sha256 "ec6008ed458fb810bc56c8faa8a8f287b624573f571bcb1d53a7d7f6ce68bc81"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
