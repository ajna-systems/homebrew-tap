# AJNA CLI —— 얼굴(ajna)과 몸(ajna-host)이 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.21"

  url "https://dl.ajna.systems/cli/0.0.21/ajna-0.0.21-linux-x86_64.tar.gz"
  sha256 "46293c53d075843ef2f535a9d8a708bce88d7db1b683d9c5d6bd84a87920f03e"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.21/ajna-0.0.21-darwin-arm64.tar.gz"
      sha256 "f639dcbc7770ef5ebab5dfe1fa97a4f16bc60893cc118a7e32ee8b7a6403fd69"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.21/ajna-0.0.21-darwin-x86_64.tar.gz"
      sha256 "dc0297f67f780147a8ab6ddb5b562b5c1ad69a1755446e5778594cff34e57159"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.21/ajna-0.0.21-linux-x86_64.tar.gz"
      sha256 "46293c53d075843ef2f535a9d8a708bce88d7db1b683d9c5d6bd84a87920f03e"
    end
  end

  def install
    bin.install "ajna", "ajna-host"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
