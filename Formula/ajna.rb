class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.145"

  url "https://dl.ajna.systems/cli/0.0.145/ajna-0.0.145-linux-x86_64.tar.gz"
  sha256 "4abc4497a9e85b4c0db71a6e836f8f448ab51bbdefd06b4f00f64aaba36e7379"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.145/ajna-0.0.145-darwin-arm64.tar.gz"
      sha256 "598c112871c84a3118d1706a5aefd3a23d95855110847d86c980c5bdeec26fab"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.145/ajna-0.0.145-darwin-x86_64.tar.gz"
      sha256 "a9db47fe187890efb7eb6d9f1dddf168c8c6d7c29cb274762dd429261427c22a"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.145/ajna-0.0.145-linux-x86_64.tar.gz"
      sha256 "4abc4497a9e85b4c0db71a6e836f8f448ab51bbdefd06b4f00f64aaba36e7379"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session", "aesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
