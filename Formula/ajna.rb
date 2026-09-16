# AJNA CLI —— 얼굴(ajna)과 몸(ajna-host)이 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.3"

  url "https://dl.ajna.systems/cli/0.0.3/ajna-0.0.3-linux-x86_64.tar.gz"
  sha256 "f6c68ad46ab32d5b2fd1250958df17a96776cce2c9aa7bfaa45f828b647578f7"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.3/ajna-0.0.3-darwin-arm64.tar.gz"
      sha256 "b9ce5ed184d6f56ebf5f8e3e2f7d240f2d3ed36bf2f79e14da14eb981f57f55b"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.3/ajna-0.0.3-darwin-x86_64.tar.gz"
      sha256 "9bd782e2833a98678c3a443ce1e0de23f01b4ce603b596764f89983979bff16a"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.3/ajna-0.0.3-linux-x86_64.tar.gz"
      sha256 "f6c68ad46ab32d5b2fd1250958df17a96776cce2c9aa7bfaa45f828b647578f7"
    end
  end

  def install
    bin.install "ajna", "ajna-host"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
