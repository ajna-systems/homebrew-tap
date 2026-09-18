# AJNA CLI —— 얼굴(ajna)과 몸(ajna-host)이 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.23"

  url "https://dl.ajna.systems/cli/0.0.23/ajna-0.0.23-linux-x86_64.tar.gz"
  sha256 "de259da0a68b897eae135efb4a79599b483ca1351c3a0d76166554366e8c4b6f"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.23/ajna-0.0.23-darwin-arm64.tar.gz"
      sha256 "53a235d4b145dffeea0dd2c742dd896627a10daa078153d99c81c2d69e0c260e"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.23/ajna-0.0.23-darwin-x86_64.tar.gz"
      sha256 "b6a057a96d41e6203cff0ff4d435e071ecdf324cebdaff5668a4817c028d250d"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.23/ajna-0.0.23-linux-x86_64.tar.gz"
      sha256 "de259da0a68b897eae135efb4a79599b483ca1351c3a0d76166554366e8c4b6f"
    end
  end

  def install
    bin.install "ajna", "ajna-host"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
