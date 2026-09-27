# AJNA CLI —— 얼굴(ajna) · 몸(ajna-host) · 세션 에이전트(ajna-remote)가 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.49"

  url "https://dl.ajna.systems/cli/0.0.49/ajna-0.0.49-linux-x86_64.tar.gz"
  sha256 "e12f076cdf199c37387f826f5a689cc2af9fb032c52d681735d10fab265c678a"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.49/ajna-0.0.49-darwin-arm64.tar.gz"
      sha256 "c3342f278b09d485cddd08925710963cca7e62b60d801e073bf2c549a6c8bd78"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.49/ajna-0.0.49-darwin-x86_64.tar.gz"
      sha256 "c2e5c56a0cc042cbcff8c192d9e0c2180921b69b2377977aa7631840e844c05f"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.49/ajna-0.0.49-linux-x86_64.tar.gz"
      sha256 "e12f076cdf199c37387f826f5a689cc2af9fb032c52d681735d10fab265c678a"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
