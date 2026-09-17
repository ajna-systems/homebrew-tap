# AJNA CLI —— 얼굴(ajna)과 몸(ajna-host)이 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.20"

  url "https://dl.ajna.systems/cli/0.0.20/ajna-0.0.20-linux-x86_64.tar.gz"
  sha256 "7a9149a5c3dd9870c7923711c59482571efc712b77145b71a4c1b40085051304"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.20/ajna-0.0.20-darwin-arm64.tar.gz"
      sha256 "e9341b66e1fbc45b9955f09c87db3278fe9a99ff4b5a7c76c2ad892462704776"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.20/ajna-0.0.20-darwin-x86_64.tar.gz"
      sha256 "86894356c67373b5fa2de70db8b44c31a7561c5322f9e8d133f6e0a08979b532"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.20/ajna-0.0.20-linux-x86_64.tar.gz"
      sha256 "7a9149a5c3dd9870c7923711c59482571efc712b77145b71a4c1b40085051304"
    end
  end

  def install
    bin.install "ajna", "ajna-host"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
