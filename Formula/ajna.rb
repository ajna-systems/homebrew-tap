# AJNA CLI —— 얼굴(ajna) · 몸(ajna-host) · 세션 에이전트(ajna-remote)가 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.51"

  url "https://dl.ajna.systems/cli/0.0.51/ajna-0.0.51-linux-x86_64.tar.gz"
  sha256 "6c83e817106084e866c5ddc641b04003470fc6516e2dd906514f7ae1a6fd2fd1"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.51/ajna-0.0.51-darwin-arm64.tar.gz"
      sha256 "346fb39362a6172ee5b66abe64eabc989ecc1142fa993be87d10752f09c0066e"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.51/ajna-0.0.51-darwin-x86_64.tar.gz"
      sha256 "ab9667188893268483123c12cd69f9514cebc4d8079a9ef0629809b643bd709c"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.51/ajna-0.0.51-linux-x86_64.tar.gz"
      sha256 "6c83e817106084e866c5ddc641b04003470fc6516e2dd906514f7ae1a6fd2fd1"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
