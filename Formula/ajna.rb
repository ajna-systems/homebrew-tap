class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.125"

  url "https://dl.ajna.systems/cli/0.0.125/ajna-0.0.125-linux-x86_64.tar.gz"
  sha256 "915a10a2834696c84060de48a6b9959aacd6b8848333604a97e3ec514f0b688e"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.125/ajna-0.0.125-darwin-arm64.tar.gz"
      sha256 "4cef54539cae925632473988ed70efd07eb811f4e788b95258bf601d3b63ccae"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.125/ajna-0.0.125-darwin-x86_64.tar.gz"
      sha256 "9fb12b53ab540b83d4af4d3654ef59f5974aab8562c4afe7dba65dd62bd8269e"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.125/ajna-0.0.125-linux-x86_64.tar.gz"
      sha256 "915a10a2834696c84060de48a6b9959aacd6b8848333604a97e3ec514f0b688e"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session", "aesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
