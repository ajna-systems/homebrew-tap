class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.152"

  url "https://dl.ajna.systems/cli/0.0.152/ajna-0.0.152-linux-x86_64.tar.gz"
  sha256 "9b25c1577b6ac4101f8f707916571853083b26091e1f575034fab71b21f5c2b6"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.152/ajna-0.0.152-darwin-arm64.tar.gz"
      sha256 "87439d80f4be4f5dee9727d277a42547b5fecdd27ec22a22c6608db55ff60b07"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.152/ajna-0.0.152-darwin-x86_64.tar.gz"
      sha256 "18bb4b180be9bfadefcb25ee0efe914c5e8ff83e5538b683b7bb5c038a942ebe"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.152/ajna-0.0.152-linux-x86_64.tar.gz"
      sha256 "9b25c1577b6ac4101f8f707916571853083b26091e1f575034fab71b21f5c2b6"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session", "aesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
