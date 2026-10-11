class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.129"

  url "https://dl.ajna.systems/cli/0.0.129/ajna-0.0.129-linux-x86_64.tar.gz"
  sha256 "8267ee7b4318748f62d1d420ec76fa344c48bba5050478669ba1018a8d06f31f"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.129/ajna-0.0.129-darwin-arm64.tar.gz"
      sha256 "870b877027e3217f118018394f4a1d6b203a4c09d921a793779626828932eb01"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.129/ajna-0.0.129-darwin-x86_64.tar.gz"
      sha256 "85f3c475419038ff926a0e7683cd3fc1a835d83bc84ec4bf5947644716423f89"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.129/ajna-0.0.129-linux-x86_64.tar.gz"
      sha256 "8267ee7b4318748f62d1d420ec76fa344c48bba5050478669ba1018a8d06f31f"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session", "aesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
