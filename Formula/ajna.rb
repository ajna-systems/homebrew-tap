# AJNA CLI —— 얼굴(ajna) · 몸(ajna-host) · 세션 에이전트(ajna-remote)가 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.65"

  url "https://dl.ajna.systems/cli/0.0.65/ajna-0.0.65-linux-x86_64.tar.gz"
  sha256 "e790558d527789fc9f9337d67b1b2ba23729be9d1ff0ef85af0773e40912d138"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.65/ajna-0.0.65-darwin-arm64.tar.gz"
      sha256 "29ce777bb127a7409f0317cdb821d2c13f85689516a99ea0f67fdeb05fafea94"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.65/ajna-0.0.65-darwin-x86_64.tar.gz"
      sha256 "3a21d930a7571b4f4a60b2cebb21a1767b02149724265603a7775c30800f85a0"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.65/ajna-0.0.65-linux-x86_64.tar.gz"
      sha256 "e790558d527789fc9f9337d67b1b2ba23729be9d1ff0ef85af0773e40912d138"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
