class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.116"

  url "https://dl.ajna.systems/cli/0.0.116/ajna-0.0.116-linux-x86_64.tar.gz"
  sha256 "6f5c4b439d60ae5662b29c80a489f9971b90a1482b4c4ea61cfa4bef8324d9f1"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.116/ajna-0.0.116-darwin-arm64.tar.gz"
      sha256 "af68cbd35518a66fdfbb0ea02363aa6ffe1b380492bb1e95a5f9a1bca14569be"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.116/ajna-0.0.116-darwin-x86_64.tar.gz"
      sha256 "8ee85d180306de1935faa936431a54c3db10fd0bae8052ccdeb6efa702de6040"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.116/ajna-0.0.116-linux-x86_64.tar.gz"
      sha256 "6f5c4b439d60ae5662b29c80a489f9971b90a1482b4c4ea61cfa4bef8324d9f1"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session", "aesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
