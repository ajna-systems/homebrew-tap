class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.136"

  url "https://dl.ajna.systems/cli/0.0.136/ajna-0.0.136-linux-x86_64.tar.gz"
  sha256 "06f1d86d014d72975e9fe812b7628c1d005b3e3fbaf2fc4f7d66bc93e871e0f7"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.136/ajna-0.0.136-darwin-arm64.tar.gz"
      sha256 "7f0f4382a332c2a271eca35a47ebdac514ab9de99a90aa55dd5795b3c2114a0e"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.136/ajna-0.0.136-darwin-x86_64.tar.gz"
      sha256 "7ab2fe9075f399525df85b46d60a28706af5529b4328b76d04dfec45562970e0"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.136/ajna-0.0.136-linux-x86_64.tar.gz"
      sha256 "06f1d86d014d72975e9fe812b7628c1d005b3e3fbaf2fc4f7d66bc93e871e0f7"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session", "aesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
