# AJNA CLI —— 얼굴(ajna)과 몸(ajna-host)이 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.3"

  url "https://dl.ajna.systems/cli/0.0.3/ajna-0.0.3-linux-x86_64.tar.gz"
  sha256 "825708fc13bc99721c7a6c392e548878d7e6bb34fce4f4d19ae5af7f97b0eee7"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.3/ajna-0.0.3-darwin-arm64.tar.gz"
      sha256 "6649324b3a461e6346f996a0b6f922fe42919a78a864b06415454c63384d9d91"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.3/ajna-0.0.3-darwin-x86_64.tar.gz"
      sha256 "a0a9a0f0a8d84f1404765163572efcfe62bad7692c3a618befa4567cd7d2d5da"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.3/ajna-0.0.3-linux-x86_64.tar.gz"
      sha256 "825708fc13bc99721c7a6c392e548878d7e6bb34fce4f4d19ae5af7f97b0eee7"
    end
  end

  def install
    bin.install "ajna", "ajna-host"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
