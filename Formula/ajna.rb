# AJNA CLI —— 얼굴(ajna) · 몸(ajna-host) · 세션 에이전트(ajna-remote)가 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.67"

  url "https://dl.ajna.systems/cli/0.0.67/ajna-0.0.67-linux-x86_64.tar.gz"
  sha256 "e787e12abf40e6f91ae5d65a8a4dcc1642a89ddfe00400e838fdf0d19b12c21e"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.67/ajna-0.0.67-darwin-arm64.tar.gz"
      sha256 "0d895cb9904b39dbeb0091bafbdb930471f6231a36b526cff5ba6baadc854f07"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.67/ajna-0.0.67-darwin-x86_64.tar.gz"
      sha256 "e7dc1da98712913cf37c9644b8d0f681c1fd9e037b5bb05a70a28366e91a8ac0"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.67/ajna-0.0.67-linux-x86_64.tar.gz"
      sha256 "e787e12abf40e6f91ae5d65a8a4dcc1642a89ddfe00400e838fdf0d19b12c21e"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
