# AJNA CLI —— 얼굴(ajna)과 몸(ajna-host)이 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.10"

  url "https://dl.ajna.systems/cli/0.0.10/ajna-0.0.10-linux-x86_64.tar.gz"
  sha256 "59b2309390c6d820675dee3d8865cf94b63a92de21d7193961f7c8a02e86979d"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.10/ajna-0.0.10-darwin-arm64.tar.gz"
      sha256 "c2ca48a8c010fde7b554c2b31ae12c414c081e88b35d1de3b70ca6b6ddcd57ec"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.10/ajna-0.0.10-darwin-x86_64.tar.gz"
      sha256 "1629c0279467656f49f7489639a97ca243a4577dfaa62fa52f5f5e876da42aca"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.10/ajna-0.0.10-linux-x86_64.tar.gz"
      sha256 "59b2309390c6d820675dee3d8865cf94b63a92de21d7193961f7c8a02e86979d"
    end
  end

  def install
    bin.install "ajna", "ajna-host"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
