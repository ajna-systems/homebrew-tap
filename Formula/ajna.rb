# AJNA CLI —— 얼굴(ajna) · 몸(ajna-host) · 세션 에이전트(ajna-remote)가 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.57"

  url "https://dl.ajna.systems/cli/0.0.57/ajna-0.0.57-linux-x86_64.tar.gz"
  sha256 "841d217d43d851228dc0a909f4f0f749be83fae26f2685e4b950caef804a4040"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.57/ajna-0.0.57-darwin-arm64.tar.gz"
      sha256 "4dc542d9ebe9395aa1a15870d841d21e6704076ddfb4b387177ce2fa3143f644"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.57/ajna-0.0.57-darwin-x86_64.tar.gz"
      sha256 "8cccb68a3fe3f44a0331ca97bcafe5efa83b654b4d2a12a570c51ddb0db10869"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.57/ajna-0.0.57-linux-x86_64.tar.gz"
      sha256 "841d217d43d851228dc0a909f4f0f749be83fae26f2685e4b950caef804a4040"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
