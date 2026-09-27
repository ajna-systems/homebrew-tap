# AJNA CLI —— 얼굴(ajna) · 몸(ajna-host) · 세션 에이전트(ajna-remote)가 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.53"

  url "https://dl.ajna.systems/cli/0.0.53/ajna-0.0.53-linux-x86_64.tar.gz"
  sha256 "2ddf557a406c462a6ae4489d2b1fc38cb2002da8d6d50ebb9268210036794160"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.53/ajna-0.0.53-darwin-arm64.tar.gz"
      sha256 "4d4c884a01b6c39c79af39c91c0739801c626e344c452410f65e0c71094f177f"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.53/ajna-0.0.53-darwin-x86_64.tar.gz"
      sha256 "2a49190cb3b68121acd8fb8af1ffdddac2dad80202e18c2f74432fbe52f0a917"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.53/ajna-0.0.53-linux-x86_64.tar.gz"
      sha256 "2ddf557a406c462a6ae4489d2b1fc38cb2002da8d6d50ebb9268210036794160"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
