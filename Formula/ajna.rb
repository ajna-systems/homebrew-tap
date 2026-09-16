# AJNA CLI —— 얼굴(ajna)과 몸(ajna-host)이 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.4"

  url "https://dl.ajna.systems/cli/0.0.4/ajna-0.0.4-linux-x86_64.tar.gz"
  sha256 "12b49905b8ced5c694505000a831f191667aa73c207116ed0e95d33ade051bff"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.4/ajna-0.0.4-darwin-arm64.tar.gz"
      sha256 "68c3feb3a7ee21267abed5ccef4fde85a13ca8c2d167ad5cadd051fa42873c0d"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.4/ajna-0.0.4-darwin-x86_64.tar.gz"
      sha256 "aa4c8cf03f600d8679a88f5722d5c9b1be1a756f4c3dfe792248a3822af3dbc3"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.4/ajna-0.0.4-linux-x86_64.tar.gz"
      sha256 "12b49905b8ced5c694505000a831f191667aa73c207116ed0e95d33ade051bff"
    end
  end

  def install
    bin.install "ajna", "ajna-host"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
