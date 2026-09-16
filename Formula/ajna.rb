# AJNA CLI —— 얼굴(ajna)과 몸(ajna-host)이 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.3"

  url "https://dl.ajna.systems/cli/0.0.3/ajna-0.0.3-linux-x86_64.tar.gz"
  sha256 "11c087494ddfbd958980c894ad880f7fe96850759dd0984f38a3a80bc5bc39c9"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.3/ajna-0.0.3-darwin-arm64.tar.gz"
      sha256 "2b9c5ac720fac883f882b8054c4c8cedb9cf752c6ab66894344241d1d296d50f"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.3/ajna-0.0.3-darwin-x86_64.tar.gz"
      sha256 "deffba370d704eb84b2e455376289cdcb9bd2ae564236e77c6631d1b8d504cef"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.3/ajna-0.0.3-linux-x86_64.tar.gz"
      sha256 "11c087494ddfbd958980c894ad880f7fe96850759dd0984f38a3a80bc5bc39c9"
    end
  end

  def install
    bin.install "ajna", "ajna-host"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
