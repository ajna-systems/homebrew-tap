# AJNA CLI —— 얼굴(ajna) · 몸(ajna-host) · 세션 에이전트(ajna-remote)가 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.60"

  url "https://dl.ajna.systems/cli/0.0.60/ajna-0.0.60-linux-x86_64.tar.gz"
  sha256 "24a3da4c010bf21d5f42b76ed8dcc7ce1d2632b03deccd01942befa8d242a7bb"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.60/ajna-0.0.60-darwin-arm64.tar.gz"
      sha256 "d8d5d61f334efaca8bdd1a1b7c3d03005d5e2145fd48abd8f90d94f136ba9f68"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.60/ajna-0.0.60-darwin-x86_64.tar.gz"
      sha256 "32dede7a72b4bb150f0452243eaaece519383e03d5f2c4f7253e6af89c0bb87f"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.60/ajna-0.0.60-linux-x86_64.tar.gz"
      sha256 "24a3da4c010bf21d5f42b76ed8dcc7ce1d2632b03deccd01942befa8d242a7bb"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
