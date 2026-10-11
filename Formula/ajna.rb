class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.119"

  url "https://dl.ajna.systems/cli/0.0.119/ajna-0.0.119-linux-x86_64.tar.gz"
  sha256 "6adb07589eb54091e0cbf59511089cc1f60586011f55f988148fbd7fe50a2b3e"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.119/ajna-0.0.119-darwin-arm64.tar.gz"
      sha256 "f6869291bb8329a7292e6650da929519ac2f07484090a6fb372c0e97beae0cc2"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.119/ajna-0.0.119-darwin-x86_64.tar.gz"
      sha256 "40f7e5579f7ecb7ff27d8f302a45bf87d6bb84b0e461f530889bea8396aa80f9"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.119/ajna-0.0.119-linux-x86_64.tar.gz"
      sha256 "6adb07589eb54091e0cbf59511089cc1f60586011f55f988148fbd7fe50a2b3e"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session", "aesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
