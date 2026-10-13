class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.143"

  url "https://dl.ajna.systems/cli/0.0.143/ajna-0.0.143-linux-x86_64.tar.gz"
  sha256 "a67ba9f657506cd122b83f543ae0d29b87ef1d7395d8404b9e19bd6b2325669c"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.143/ajna-0.0.143-darwin-arm64.tar.gz"
      sha256 "b12ff5a340f40d29019d6cf28a72b733262a7cfa49e70476c95c9331b8b24a7e"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.143/ajna-0.0.143-darwin-x86_64.tar.gz"
      sha256 "12ef2873c14e8145ee94e29267bcfda06da4835962639fc3a2b38f4c10e0c243"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.143/ajna-0.0.143-linux-x86_64.tar.gz"
      sha256 "a67ba9f657506cd122b83f543ae0d29b87ef1d7395d8404b9e19bd6b2325669c"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session", "aesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
