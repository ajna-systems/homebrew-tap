# AJNA CLI —— 얼굴(ajna) · 몸(ajna-host) · 세션 에이전트(ajna-remote)가 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.68"

  url "https://dl.ajna.systems/cli/0.0.68/ajna-0.0.68-linux-x86_64.tar.gz"
  sha256 "0cdae034ae14d91764ea65570f0c08ada41177ba62b72cabecab74958014485f"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.68/ajna-0.0.68-darwin-arm64.tar.gz"
      sha256 "592d465e9be5d2116061311d450a86874924d3eba785ddacfd073b48df5d5444"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.68/ajna-0.0.68-darwin-x86_64.tar.gz"
      sha256 "62ec69b187e876aed5a0414f83db3705288e96635e21684e64d6513ffda070dc"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.68/ajna-0.0.68-linux-x86_64.tar.gz"
      sha256 "0cdae034ae14d91764ea65570f0c08ada41177ba62b72cabecab74958014485f"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
