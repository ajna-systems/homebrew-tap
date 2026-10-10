class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.102"

  url "https://dl.ajna.systems/cli/0.0.102/ajna-0.0.102-linux-x86_64.tar.gz"
  sha256 "9dc7a8c3005bd6fd0457aee23e18cd12d5968736e76022c18fd2ec2ccf89636f"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.102/ajna-0.0.102-darwin-arm64.tar.gz"
      sha256 "7bb6cec499a309122bba9c4618bdca8a33ecbc36cd99ca6332a89c970ac483a0"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.102/ajna-0.0.102-darwin-x86_64.tar.gz"
      sha256 "bc7e38c78aead330527494f67d30c9574467582583565f2f65663a9065e1d7f6"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.102/ajna-0.0.102-linux-x86_64.tar.gz"
      sha256 "9dc7a8c3005bd6fd0457aee23e18cd12d5968736e76022c18fd2ec2ccf89636f"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session", "aesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
