# AJNA CLI —— 얼굴(ajna) · 몸(ajna-host) · 세션 에이전트(ajna-remote)가 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.59"

  url "https://dl.ajna.systems/cli/0.0.59/ajna-0.0.59-linux-x86_64.tar.gz"
  sha256 "3910c73cd422a169cfb3d00331b3765b35123e8d08e2caef2cc4faa4b5485619"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.59/ajna-0.0.59-darwin-arm64.tar.gz"
      sha256 "75f07bf575be74e686814f1d8830bcf3bfa9e93203d6e00c4626ae6f8516abe8"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.59/ajna-0.0.59-darwin-x86_64.tar.gz"
      sha256 "1ab64487f8aad9076dfa17f0bbf5d5bb1847b94d2bc60175f7488dddc28bf1b1"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.59/ajna-0.0.59-linux-x86_64.tar.gz"
      sha256 "3910c73cd422a169cfb3d00331b3765b35123e8d08e2caef2cc4faa4b5485619"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
