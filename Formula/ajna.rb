# AJNA CLI —— 얼굴(ajna)과 몸(ajna-host)이 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.33"

  url "https://dl.ajna.systems/cli/0.0.33/ajna-0.0.33-linux-x86_64.tar.gz"
  sha256 "955d1430278478ecc5ab86b2476eb4c54dac583c28e23a4c60da4880d11ea8c2"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.33/ajna-0.0.33-darwin-arm64.tar.gz"
      sha256 "7b1e2aa809e0d7ede490512c7f811dd2d4e1abe6e37bf5dad23fea07c9abd715"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.33/ajna-0.0.33-darwin-x86_64.tar.gz"
      sha256 "8f18d78baf68bc462d1bfe911a830198d7de91cc26b61e4a80f8e54addfe5554"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.33/ajna-0.0.33-linux-x86_64.tar.gz"
      sha256 "955d1430278478ecc5ab86b2476eb4c54dac583c28e23a4c60da4880d11ea8c2"
    end
  end

  def install
    bin.install "ajna", "ajna-host"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
