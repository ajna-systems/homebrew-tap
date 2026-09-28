# AJNA CLI —— 얼굴(ajna) · 몸(ajna-host) · 세션 에이전트(ajna-remote)가 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.61"

  url "https://dl.ajna.systems/cli/0.0.61/ajna-0.0.61-linux-x86_64.tar.gz"
  sha256 "40d1a4a9142e3a30bf0cc64b85256ceb93b1ae1ede93750b6f75bbbf6e6dcaf3"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.61/ajna-0.0.61-darwin-arm64.tar.gz"
      sha256 "500257c240e584e0b1aa86820394f76e023197b31b4b300dd7e1dc54e7631b64"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.61/ajna-0.0.61-darwin-x86_64.tar.gz"
      sha256 "59eb9b8b9f6698887c03917838e460b2f047735e296b67ceb7759501d5e81e6e"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.61/ajna-0.0.61-linux-x86_64.tar.gz"
      sha256 "40d1a4a9142e3a30bf0cc64b85256ceb93b1ae1ede93750b6f75bbbf6e6dcaf3"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
