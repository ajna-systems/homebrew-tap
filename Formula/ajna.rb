# AJNA CLI —— 얼굴(ajna)과 몸(ajna-host)이 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.28"

  url "https://dl.ajna.systems/cli/0.0.28/ajna-0.0.28-linux-x86_64.tar.gz"
  sha256 "a7f1f970626962a021745a598fcab10c7510497342ff0c036e45910ebe92a021"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.28/ajna-0.0.28-darwin-arm64.tar.gz"
      sha256 "26790d826ea1cc7f9b12720c6488cade23a35285bb77618e6e8daf550896e77c"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.28/ajna-0.0.28-darwin-x86_64.tar.gz"
      sha256 "a5b806a66d30f0dea401555c63dd9dfcca2e05c403823a91bcace16f1060485f"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.28/ajna-0.0.28-linux-x86_64.tar.gz"
      sha256 "a7f1f970626962a021745a598fcab10c7510497342ff0c036e45910ebe92a021"
    end
  end

  def install
    bin.install "ajna", "ajna-host"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
