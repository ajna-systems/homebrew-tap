# AJNA CLI —— 얼굴(ajna)과 몸(ajna-host)이 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.6"

  url "https://dl.ajna.systems/cli/0.0.6/ajna-0.0.6-linux-x86_64.tar.gz"
  sha256 "7d2566ff8925dc2c507cd4f50c258d6377395b2131779cbd722584672cfce0b2"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.6/ajna-0.0.6-darwin-arm64.tar.gz"
      sha256 "f0f4d9240941aed25b83eff7271c93e72454e680d155a6ed296afbde9092c840"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.6/ajna-0.0.6-darwin-x86_64.tar.gz"
      sha256 "8fd3c34d2539797dbbf89c04570d1aa77ceb72665bd2353c5ffae60e26f0fe90"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.6/ajna-0.0.6-linux-x86_64.tar.gz"
      sha256 "7d2566ff8925dc2c507cd4f50c258d6377395b2131779cbd722584672cfce0b2"
    end
  end

  def install
    bin.install "ajna", "ajna-host"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
