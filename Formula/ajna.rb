# AJNA CLI —— 얼굴(ajna)과 몸(ajna-host)이 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.30"

  url "https://dl.ajna.systems/cli/0.0.30/ajna-0.0.30-linux-x86_64.tar.gz"
  sha256 "78d138d56b8fb6866098ffc07e9aa22bfaef9a0eee62a6000f2c9f6c93f43562"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.30/ajna-0.0.30-darwin-arm64.tar.gz"
      sha256 "ee3b504563b43dcb05eb2870af6f46a7a5df205cf6f759a5e79599f98f2dd295"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.30/ajna-0.0.30-darwin-x86_64.tar.gz"
      sha256 "16d7c86613959d7d5ffa7a7757dac46ab59944fe617442d78720a3468db1074b"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.30/ajna-0.0.30-linux-x86_64.tar.gz"
      sha256 "78d138d56b8fb6866098ffc07e9aa22bfaef9a0eee62a6000f2c9f6c93f43562"
    end
  end

  def install
    bin.install "ajna", "ajna-host"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
