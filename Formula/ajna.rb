class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.115"

  url "https://dl.ajna.systems/cli/0.0.115/ajna-0.0.115-linux-x86_64.tar.gz"
  sha256 "7df5a6a242a8a9df11ec659aedc30f9a30205a21aba68f570db9647fef7e4051"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.115/ajna-0.0.115-darwin-arm64.tar.gz"
      sha256 "74b7c4b766dfd07b14924d76a838010905a4dc73c4a315cbc5969ee09d05a18b"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.115/ajna-0.0.115-darwin-x86_64.tar.gz"
      sha256 "7972137927d1b27e41e45216880d29eb01a4ee2bbb1095f6ccc93398f3a906e5"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.115/ajna-0.0.115-linux-x86_64.tar.gz"
      sha256 "7df5a6a242a8a9df11ec659aedc30f9a30205a21aba68f570db9647fef7e4051"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote", "ajna-session", "aesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
