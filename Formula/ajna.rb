class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.106"

  url "https://dl.ajna.systems/cli/0.0.106/ajna-0.0.106-linux-x86_64.tar.gz"
  sha256 "f0be4a9752d6c319f0f05e13732cb3e9c7181843c1021ff36b2952416afba899"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.106/ajna-0.0.106-darwin-arm64.tar.gz"
      sha256 "081fa8410ff7d88da6d55d77690bdf12b0b3a09b8dd04f9e782346e38730da06"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.106/ajna-0.0.106-darwin-x86_64.tar.gz"
      sha256 "852a0c6e9ba90ee701e94511b9c50a2b8beb9cd40ad78e2cf973c9e3a0d5b2d9"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.106/ajna-0.0.106-linux-x86_64.tar.gz"
      sha256 "f0be4a9752d6c319f0f05e13732cb3e9c7181843c1021ff36b2952416afba899"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session", "aesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
