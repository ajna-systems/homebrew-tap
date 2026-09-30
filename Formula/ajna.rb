# AJNA CLI —— 얼굴(ajna) · 몸(ajna-host) · 세션 에이전트(ajna-remote)가 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.73"

  url "https://dl.ajna.systems/cli/0.0.73/ajna-0.0.73-linux-x86_64.tar.gz"
  sha256 "7c06e79f2023eb83a0b90203666c2394028a884ad9e036a4ca70684bc6c13639"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.73/ajna-0.0.73-darwin-arm64.tar.gz"
      sha256 "d5ed250d2a1b01ef6a0faf80bbe243c73d26ba366315e539c7a57100fcf4d18e"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.73/ajna-0.0.73-darwin-x86_64.tar.gz"
      sha256 "428634fc378d2d3c41ab8f3f8b3faf1ec70cf4fce351f35e0e365062e4ce0cb8"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.73/ajna-0.0.73-linux-x86_64.tar.gz"
      sha256 "7c06e79f2023eb83a0b90203666c2394028a884ad9e036a4ca70684bc6c13639"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
