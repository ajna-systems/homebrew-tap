# AJNA CLI —— 얼굴(ajna)과 몸(ajna-host)이 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.8"

  url "https://dl.ajna.systems/cli/0.0.8/ajna-0.0.8-linux-x86_64.tar.gz"
  sha256 "13c8ad22c6ed2cf09c1aae243dcf639ac33a3867c59389ff8ac42df5b99510ba"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.8/ajna-0.0.8-darwin-arm64.tar.gz"
      sha256 "7abfeb94fc356c84cbb9d5d16ad7cf7f094f7d1b05aeb8d12c9b15385f680b1b"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.8/ajna-0.0.8-darwin-x86_64.tar.gz"
      sha256 "3eca3d56d76326170ce8c5b3cb356029ba7e3cafd979aeda172f2aa60091ec39"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.8/ajna-0.0.8-linux-x86_64.tar.gz"
      sha256 "13c8ad22c6ed2cf09c1aae243dcf639ac33a3867c59389ff8ac42df5b99510ba"
    end
  end

  def install
    bin.install "ajna", "ajna-host"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
