# AJNA CLI —— 얼굴(ajna) · 몸(ajna-host) · 세션 에이전트(ajna-remote)가 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.48"

  url "https://dl.ajna.systems/cli/0.0.48/ajna-0.0.48-linux-x86_64.tar.gz"
  sha256 "b21618e7ba15721c6bfd52642c3c257ba42851cc93f94d69468a0cd9618052b6"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.48/ajna-0.0.48-darwin-arm64.tar.gz"
      sha256 "8cafad13fd2881262c30348fecff6f50b5ca21fae095dc7641b7dc52b43cbb2a"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.48/ajna-0.0.48-darwin-x86_64.tar.gz"
      sha256 "50c74fd131f681a5b6a9b5a8113aa61996e0966113853d88846e85c4fcc51078"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.48/ajna-0.0.48-linux-x86_64.tar.gz"
      sha256 "b21618e7ba15721c6bfd52642c3c257ba42851cc93f94d69468a0cd9618052b6"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
