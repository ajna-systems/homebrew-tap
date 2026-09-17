# AJNA CLI —— 얼굴(ajna)과 몸(ajna-host)이 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.17"

  url "https://dl.ajna.systems/cli/0.0.17/ajna-0.0.17-linux-x86_64.tar.gz"
  sha256 "39f6b25079fac426530df3e70a42fb7065cc13ed0a6df9d150eba1a67fd5912d"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.17/ajna-0.0.17-darwin-arm64.tar.gz"
      sha256 "df92f7c70befec273e6f276742ccc414afcc6e509cadae0f6583069f9bedfa4e"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.17/ajna-0.0.17-darwin-x86_64.tar.gz"
      sha256 "37682df6721022bd7d1603c182996254872164eb35b5171c8ea59cf3a6fa458a"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.17/ajna-0.0.17-linux-x86_64.tar.gz"
      sha256 "39f6b25079fac426530df3e70a42fb7065cc13ed0a6df9d150eba1a67fd5912d"
    end
  end

  def install
    bin.install "ajna", "ajna-host"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
