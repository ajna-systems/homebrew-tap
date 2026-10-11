class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.113"

  url "https://dl.ajna.systems/cli/0.0.113/ajna-0.0.113-linux-x86_64.tar.gz"
  sha256 "cef61488580f48f035c340bf0dd6bb73f853c12520bfb28fa12245a2dc81c2cc"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.113/ajna-0.0.113-darwin-arm64.tar.gz"
      sha256 "7196fc332605cff2480570fa5e99ed4982160b47896c17c5b216328caaa97598"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.113/ajna-0.0.113-darwin-x86_64.tar.gz"
      sha256 "0411246357764490f42301bd01e6eeee8707357593e29d5d0dd54b6ab0d48795"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.113/ajna-0.0.113-linux-x86_64.tar.gz"
      sha256 "cef61488580f48f035c340bf0dd6bb73f853c12520bfb28fa12245a2dc81c2cc"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session", "aesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
