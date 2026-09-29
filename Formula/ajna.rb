# AJNA CLI —— 얼굴(ajna) · 몸(ajna-host) · 세션 에이전트(ajna-remote)가 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.69"

  url "https://dl.ajna.systems/cli/0.0.69/ajna-0.0.69-linux-x86_64.tar.gz"
  sha256 "2250fe96e8477a5e5c50b9e000d26cd110c554a8b41ff494626d3e4fcbfabdd6"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.69/ajna-0.0.69-darwin-arm64.tar.gz"
      sha256 "688b23c1374fdf45f7aba1a4f1a7a11fa1e407e2e554f9ac29c1033040e89ddf"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.69/ajna-0.0.69-darwin-x86_64.tar.gz"
      sha256 "258ce75ece42b7a42fdac3a0269ec4cae5d7370f158b5df37f96c0d93e041b40"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.69/ajna-0.0.69-linux-x86_64.tar.gz"
      sha256 "2250fe96e8477a5e5c50b9e000d26cd110c554a8b41ff494626d3e4fcbfabdd6"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
