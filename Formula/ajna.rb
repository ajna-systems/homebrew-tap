# AJNA CLI —— 얼굴(ajna)과 몸(ajna-host)이 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.15"

  url "https://dl.ajna.systems/cli/0.0.15/ajna-0.0.15-linux-x86_64.tar.gz"
  sha256 "6335d6e461d35756089618aa7e78f7dce9a0aef52536dcd7c81d635721348d68"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.15/ajna-0.0.15-darwin-arm64.tar.gz"
      sha256 "8c6e8c630f18908b251eef9204183ec01f2b435fb853c3fed5e1c37fa34c2cbb"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.15/ajna-0.0.15-darwin-x86_64.tar.gz"
      sha256 "cfee2c52d5928f76331c6357144c1de2ad13728d7b7e01b2e3702dae04d27fd3"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.15/ajna-0.0.15-linux-x86_64.tar.gz"
      sha256 "6335d6e461d35756089618aa7e78f7dce9a0aef52536dcd7c81d635721348d68"
    end
  end

  def install
    bin.install "ajna", "ajna-host"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
