# AJNA CLI —— 얼굴(ajna) · 몸(ajna-host) · 세션 에이전트(ajna-remote)가 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.66"

  url "https://dl.ajna.systems/cli/0.0.66/ajna-0.0.66-linux-x86_64.tar.gz"
  sha256 "625b28fd3992a93f2c422c04c5d482e3e1b5bd1c03bf960f2a425e197b040c86"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.66/ajna-0.0.66-darwin-arm64.tar.gz"
      sha256 "528f10fd2b4ca3dac7539722208ffe230ccf00cbcb36644e0b83102c20329563"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.66/ajna-0.0.66-darwin-x86_64.tar.gz"
      sha256 "ff0f6893761359f2f556bd8c7b8a715183ba3fcfda8d93f507620c8a45c12841"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.66/ajna-0.0.66-linux-x86_64.tar.gz"
      sha256 "625b28fd3992a93f2c422c04c5d482e3e1b5bd1c03bf960f2a425e197b040c86"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
