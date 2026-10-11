class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.112"

  url "https://dl.ajna.systems/cli/0.0.112/ajna-0.0.112-linux-x86_64.tar.gz"
  sha256 "b91c5421bcb61c0de0cb994c9553364a439f522f48f90fb2307f8aca2c699407"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.112/ajna-0.0.112-darwin-arm64.tar.gz"
      sha256 "393f3548148f7e5180574a3e54aafe69f57cccdfcb71e47b8a132879d8d6011b"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.112/ajna-0.0.112-darwin-x86_64.tar.gz"
      sha256 "941b132184d639ede4cadd1c4597c13450928da40c24c7d3c9560b62a5975907"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.112/ajna-0.0.112-linux-x86_64.tar.gz"
      sha256 "b91c5421bcb61c0de0cb994c9553364a439f522f48f90fb2307f8aca2c699407"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session", "aesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
