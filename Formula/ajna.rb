class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.133"

  url "https://dl.ajna.systems/cli/0.0.133/ajna-0.0.133-linux-x86_64.tar.gz"
  sha256 "22fd22a5eb855194ceb30cefa88f19bbb7ea1806e970e1dbb4376679598e74e9"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.133/ajna-0.0.133-darwin-arm64.tar.gz"
      sha256 "5c42be6a2e75984f172a419be290f073d27696dec4275f14787d485c5b01896e"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.133/ajna-0.0.133-darwin-x86_64.tar.gz"
      sha256 "a93c6566bc8a018435086fddf64938f8a6453a119cb0171bb53a274ada625dc4"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.133/ajna-0.0.133-linux-x86_64.tar.gz"
      sha256 "22fd22a5eb855194ceb30cefa88f19bbb7ea1806e970e1dbb4376679598e74e9"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session", "aesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
