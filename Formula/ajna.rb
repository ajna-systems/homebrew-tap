# AJNA CLI —— 얼굴(ajna) · 몸(ajna-host) · 세션 에이전트(ajna-remote)가 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.54"

  url "https://dl.ajna.systems/cli/0.0.54/ajna-0.0.54-linux-x86_64.tar.gz"
  sha256 "b455fc7fbf2205f90c9e7210594c66b03cef5d20d2dd480a1ea9077515a53058"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.54/ajna-0.0.54-darwin-arm64.tar.gz"
      sha256 "682aad7750272133a53f6f3299bda437f1699f636e2cdc075fbb611a09742c2f"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.54/ajna-0.0.54-darwin-x86_64.tar.gz"
      sha256 "a04d2909e214c2ac5ad189e2b7dd6256b28c3e2a48254bdae535c6ca0bd1f1e0"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.54/ajna-0.0.54-linux-x86_64.tar.gz"
      sha256 "b455fc7fbf2205f90c9e7210594c66b03cef5d20d2dd480a1ea9077515a53058"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
