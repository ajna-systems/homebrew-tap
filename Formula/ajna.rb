# AJNA CLI —— 얼굴(ajna)과 몸(ajna-host)이 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.26"

  url "https://dl.ajna.systems/cli/0.0.26/ajna-0.0.26-linux-x86_64.tar.gz"
  sha256 "5ed7d5f5954d79d4ece64c9627ebfd6031fcecf907de8a3ee788582fab6504e6"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.26/ajna-0.0.26-darwin-arm64.tar.gz"
      sha256 "8a6c15855a67783f1153866e5048314c98b9e965e28d1e86a163e0d49f8d8ecf"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.26/ajna-0.0.26-darwin-x86_64.tar.gz"
      sha256 "382a6cc465e9b16e51e698011506a8884108b022f2e6f1cd18c9da9b7ce0f2b7"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.26/ajna-0.0.26-linux-x86_64.tar.gz"
      sha256 "5ed7d5f5954d79d4ece64c9627ebfd6031fcecf907de8a3ee788582fab6504e6"
    end
  end

  def install
    bin.install "ajna", "ajna-host"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
