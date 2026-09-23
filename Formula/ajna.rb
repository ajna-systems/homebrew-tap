# AJNA CLI —— 얼굴(ajna)과 몸(ajna-host)이 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.35"

  url "https://dl.ajna.systems/cli/0.0.35/ajna-0.0.35-linux-x86_64.tar.gz"
  sha256 "445e99362bc16c690fe78f6fe6f53ef66e16e3dbf9cb8469d2208d002aed71b7"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.35/ajna-0.0.35-darwin-arm64.tar.gz"
      sha256 "0e32abadd21f9ca9632d6be24355d6ce3fe4cc23baa947c063f7b78938687a52"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.35/ajna-0.0.35-darwin-x86_64.tar.gz"
      sha256 "56d8699097fb30d0fcaca9454fa9e4bef80eeb64a4b4348c5db4a3367c414e08"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.35/ajna-0.0.35-linux-x86_64.tar.gz"
      sha256 "445e99362bc16c690fe78f6fe6f53ef66e16e3dbf9cb8469d2208d002aed71b7"
    end
  end

  def install
    bin.install "ajna", "ajna-host"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
