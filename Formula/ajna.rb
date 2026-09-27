# AJNA CLI —— 얼굴(ajna) · 몸(ajna-host) · 세션 에이전트(ajna-remote)가 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.55"

  url "https://dl.ajna.systems/cli/0.0.55/ajna-0.0.55-linux-x86_64.tar.gz"
  sha256 "0123d419cfd6a0e1a16b3653e654e4190d826305a69f8505c45a496584e7fb04"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.55/ajna-0.0.55-darwin-arm64.tar.gz"
      sha256 "20b51d27c7b3b2dea3407404d40dff28c17eacdb593699c1bdedfb299c6863f2"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.55/ajna-0.0.55-darwin-x86_64.tar.gz"
      sha256 "76e8ec365bbc591f0c88b9a55db40bfa2b7439242df90e97de44da47654723e0"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.55/ajna-0.0.55-linux-x86_64.tar.gz"
      sha256 "0123d419cfd6a0e1a16b3653e654e4190d826305a69f8505c45a496584e7fb04"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
