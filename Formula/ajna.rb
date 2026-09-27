# AJNA CLI —— 얼굴(ajna) · 몸(ajna-host) · 세션 에이전트(ajna-remote)가 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.46"

  url "https://dl.ajna.systems/cli/0.0.46/ajna-0.0.46-linux-x86_64.tar.gz"
  sha256 "86564aad68408f6eb0ba2538b15d162f1189a58717309659d772ce997739f737"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.46/ajna-0.0.46-darwin-arm64.tar.gz"
      sha256 "104e0182f88c64c1b7da4b267489a3e0ecfc502592fa7ba80cc58033969cc0c0"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.46/ajna-0.0.46-darwin-x86_64.tar.gz"
      sha256 "be14a5aa5243a88d79b3a35d3ae1264ca65e71337d4af61687fd80e0e247f092"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.46/ajna-0.0.46-linux-x86_64.tar.gz"
      sha256 "86564aad68408f6eb0ba2538b15d162f1189a58717309659d772ce997739f737"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
