class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.156"

  url "https://dl.ajna.systems/cli/0.0.156/ajna-0.0.156-linux-x86_64.tar.gz"
  sha256 "7688e85f1fea24f815387e91ebc43d9a311688cb8005e09bc8faf6dec29a719c"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.156/ajna-0.0.156-darwin-arm64.tar.gz"
      sha256 "da21f030eedf0e5a7454be5ad0fb289eee26ddf29d4b45813835a37fbc6f940b"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.156/ajna-0.0.156-darwin-x86_64.tar.gz"
      sha256 "ab87411915032b31fb2be79f10ab176a622fbeed7fba6fee9d6d73f31712a64d"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.156/ajna-0.0.156-linux-x86_64.tar.gz"
      sha256 "7688e85f1fea24f815387e91ebc43d9a311688cb8005e09bc8faf6dec29a719c"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session", "aesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
