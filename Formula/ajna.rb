# AJNA CLI —— 얼굴(ajna)과 몸(ajna-host)이 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.31"

  url "https://dl.ajna.systems/cli/0.0.31/ajna-0.0.31-linux-x86_64.tar.gz"
  sha256 "fc2108211639a065d6a0d8cda53a0632b19b81d722ee4f23a593cc82afd897a6"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.31/ajna-0.0.31-darwin-arm64.tar.gz"
      sha256 "532ec564a15cbdc50a31cf98ae0efef09b64cfde33caefc2d024d61697c81dc4"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.31/ajna-0.0.31-darwin-x86_64.tar.gz"
      sha256 "27089845e47b4a9c1dde5469c4ea36a37170860294bb67962828d4cd94ae4515"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.31/ajna-0.0.31-linux-x86_64.tar.gz"
      sha256 "fc2108211639a065d6a0d8cda53a0632b19b81d722ee4f23a593cc82afd897a6"
    end
  end

  def install
    bin.install "ajna", "ajna-host"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
