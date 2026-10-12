class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.139"

  url "https://dl.ajna.systems/cli/0.0.139/ajna-0.0.139-linux-x86_64.tar.gz"
  sha256 "962fad5af669271282653956f9268afbcb707cc40f37349d8055f76889a12ecb"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.139/ajna-0.0.139-darwin-arm64.tar.gz"
      sha256 "d538c6102a5fde3f6bebdea42ca6f0e7100e2555c0ba1bf3380af3efd83e7a06"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.139/ajna-0.0.139-darwin-x86_64.tar.gz"
      sha256 "78024ecd90864f8fd732582ca24c016b0d4805cb24dfd273f4f5bd99d7f6e351"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.139/ajna-0.0.139-linux-x86_64.tar.gz"
      sha256 "962fad5af669271282653956f9268afbcb707cc40f37349d8055f76889a12ecb"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session", "aesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
