# AJNA CLI —— 얼굴(ajna) · 몸(ajna-host) · 세션 에이전트(ajna-remote)가 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.71"

  url "https://dl.ajna.systems/cli/0.0.71/ajna-0.0.71-linux-x86_64.tar.gz"
  sha256 "b3dc2f0d64afd376ba465fdeaffcf6ea56f3fc8e752b2b07ccbbf8e148e47042"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.71/ajna-0.0.71-darwin-arm64.tar.gz"
      sha256 "f25268da03bed079e578599fae82b3123f594c75606ab218eef27b18330c8af1"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.71/ajna-0.0.71-darwin-x86_64.tar.gz"
      sha256 "853315127ef5e93e2805c70f47aa043eb1420405e51fa09dadc745a5f7ea20b0"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.71/ajna-0.0.71-linux-x86_64.tar.gz"
      sha256 "b3dc2f0d64afd376ba465fdeaffcf6ea56f3fc8e752b2b07ccbbf8e148e47042"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
