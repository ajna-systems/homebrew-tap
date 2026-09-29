# AJNA CLI —— 얼굴(ajna) · 몸(ajna-host) · 세션 에이전트(ajna-remote)가 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.63"

  url "https://dl.ajna.systems/cli/0.0.63/ajna-0.0.63-linux-x86_64.tar.gz"
  sha256 "f7b8fe1fa5a941ac30e3f5bec57695c83e0e0ee091021f22ceb9fdd0d3c21148"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.63/ajna-0.0.63-darwin-arm64.tar.gz"
      sha256 "631c20709d27e0bdb0f0a2dcd6a2fe7d18332322521b869a74402d6267443be1"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.63/ajna-0.0.63-darwin-x86_64.tar.gz"
      sha256 "5cc6887a5e425f118e438fbcbb95d7cf79bfda9dcaaa439f8c8523035e613aa0"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.63/ajna-0.0.63-linux-x86_64.tar.gz"
      sha256 "f7b8fe1fa5a941ac30e3f5bec57695c83e0e0ee091021f22ceb9fdd0d3c21148"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
