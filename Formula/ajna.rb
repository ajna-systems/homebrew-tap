# AJNA CLI —— 얼굴(ajna)과 몸(ajna-host)이 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.11"

  url "https://dl.ajna.systems/cli/0.0.11/ajna-0.0.11-linux-x86_64.tar.gz"
  sha256 "4e45d2fe5fdd8a3a568151e3fe62decdd91c7a4d9afc8e49abb64b8a29694dff"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.11/ajna-0.0.11-darwin-arm64.tar.gz"
      sha256 "d4dde1afb82d7928e869dcf05a504df5b6196891213018e7ac82a02c785ce6c0"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.11/ajna-0.0.11-darwin-x86_64.tar.gz"
      sha256 "c843e073e3e556fb8ee5ab48cea1ace8991ace361e3dc06af0345557bdce61bb"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.11/ajna-0.0.11-linux-x86_64.tar.gz"
      sha256 "4e45d2fe5fdd8a3a568151e3fe62decdd91c7a4d9afc8e49abb64b8a29694dff"
    end
  end

  def install
    bin.install "ajna", "ajna-host"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
