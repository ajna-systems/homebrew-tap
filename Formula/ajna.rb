# AJNA CLI —— 얼굴(ajna) · 몸(ajna-host) · 세션 에이전트(ajna-remote)가 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.70"

  url "https://dl.ajna.systems/cli/0.0.70/ajna-0.0.70-linux-x86_64.tar.gz"
  sha256 "a998a5d960ebb01713f96d5254ce543c45775d75846232492bb3662a82a74890"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.70/ajna-0.0.70-darwin-arm64.tar.gz"
      sha256 "b81cb8980b3bbd3a5b9de9103d33dded01812d6a65bacff1a060bb13bd331852"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.70/ajna-0.0.70-darwin-x86_64.tar.gz"
      sha256 "6067292d320e0d84641825347a3d37d3ac378b92157b6e65cb47bdc2ae74fba9"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.70/ajna-0.0.70-linux-x86_64.tar.gz"
      sha256 "a998a5d960ebb01713f96d5254ce543c45775d75846232492bb3662a82a74890"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
