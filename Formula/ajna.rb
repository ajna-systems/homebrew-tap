# AJNA CLI —— 얼굴(ajna)과 몸(ajna-host)이 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.44"

  url "https://dl.ajna.systems/cli/0.0.44/ajna-0.0.44-linux-x86_64.tar.gz"
  sha256 "a2bc68bdf7d8cdefdf96ce58277abb050d8bd9092e85d457ecfe1ed80c4eec83"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.44/ajna-0.0.44-darwin-arm64.tar.gz"
      sha256 "e9ab3c7b1356695d7632b42f47bbb53ee9841cf92df1db52674f6b057292b77b"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.44/ajna-0.0.44-darwin-x86_64.tar.gz"
      sha256 "2573cb75643f67c38fe7aad23b13b728aed2c220eb7ff18fe182f7d86d91d336"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.44/ajna-0.0.44-linux-x86_64.tar.gz"
      sha256 "a2bc68bdf7d8cdefdf96ce58277abb050d8bd9092e85d457ecfe1ed80c4eec83"
    end
  end

  def install
    bin.install "ajna", "ajna-host"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
