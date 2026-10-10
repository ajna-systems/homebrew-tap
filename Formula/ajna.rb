class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.104"

  url "https://dl.ajna.systems/cli/0.0.104/ajna-0.0.104-linux-x86_64.tar.gz"
  sha256 "0f03c2b8b830c716b17b3b16c50c150dc6a542fdfa5980b8a2439cc6219b8bc2"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.104/ajna-0.0.104-darwin-arm64.tar.gz"
      sha256 "dc61b54ed1fe39b4706cda5691851ba97fe5cb03bcfeb2305aaecf04cfd8436f"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.104/ajna-0.0.104-darwin-x86_64.tar.gz"
      sha256 "c40a92956f637e03bf399266ebbe2d28678291f416616d7120017dd427dd1859"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.104/ajna-0.0.104-linux-x86_64.tar.gz"
      sha256 "0f03c2b8b830c716b17b3b16c50c150dc6a542fdfa5980b8a2439cc6219b8bc2"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session", "aesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
