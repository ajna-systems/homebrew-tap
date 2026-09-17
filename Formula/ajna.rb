# AJNA CLI —— 얼굴(ajna)과 몸(ajna-host)이 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.22"

  url "https://dl.ajna.systems/cli/0.0.22/ajna-0.0.22-linux-x86_64.tar.gz"
  sha256 "d1a191a209853c7186f88969b3a12c22a555110e1506c0a60b3ea09cabde621e"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.22/ajna-0.0.22-darwin-arm64.tar.gz"
      sha256 "6af97f70b5eced2b5e745a1d0b397379475ec030fc6683ad772bcff2a942983d"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.22/ajna-0.0.22-darwin-x86_64.tar.gz"
      sha256 "47dedeaf59f93e13cc90a19b7d86e5f2f10e2534db422dc1202b7d1ffde993f7"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.22/ajna-0.0.22-linux-x86_64.tar.gz"
      sha256 "d1a191a209853c7186f88969b3a12c22a555110e1506c0a60b3ea09cabde621e"
    end
  end

  def install
    bin.install "ajna", "ajna-host"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
