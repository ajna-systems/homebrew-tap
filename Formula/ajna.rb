# AJNA CLI —— 얼굴(ajna) · 몸(ajna-host) · 세션 에이전트(ajna-remote)가 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.76"

  url "https://dl.ajna.systems/cli/0.0.76/ajna-0.0.76-linux-x86_64.tar.gz"
  sha256 "0b2e43c045581d24a172c3be480d26a240357e828025c1ce5a3269f57c07afea"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.76/ajna-0.0.76-darwin-arm64.tar.gz"
      sha256 "3968d5d0c744b029dd3e5d9a9934ce27de7615ddceff61ab04e9d3023370f9c0"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.76/ajna-0.0.76-darwin-x86_64.tar.gz"
      sha256 "6c6005af24fe85dab64b3b1d56d0388942741bf5a5a204d84303ea1023996efa"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.76/ajna-0.0.76-linux-x86_64.tar.gz"
      sha256 "0b2e43c045581d24a172c3be480d26a240357e828025c1ce5a3269f57c07afea"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
