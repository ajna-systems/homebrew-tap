# AJNA CLI —— 얼굴(ajna) · 몸(ajna-host) · 세션 에이전트(ajna-remote)가 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.62"

  url "https://dl.ajna.systems/cli/0.0.62/ajna-0.0.62-linux-x86_64.tar.gz"
  sha256 "b983035ceb3f795207acb6457c1f65ee219bcab264ac85ffc885e85befd8d735"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.62/ajna-0.0.62-darwin-arm64.tar.gz"
      sha256 "ab1f4f4b92ce974e103ffffe1851e0cbc1e06d922212718effd46c5bef05913f"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.62/ajna-0.0.62-darwin-x86_64.tar.gz"
      sha256 "d3ef08c22a471b8603fdb715cf19e6f0e39354d8dd7137e0b18b202afcb128ba"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.62/ajna-0.0.62-linux-x86_64.tar.gz"
      sha256 "b983035ceb3f795207acb6457c1f65ee219bcab264ac85ffc885e85befd8d735"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
