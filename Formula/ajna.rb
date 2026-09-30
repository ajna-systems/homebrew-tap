# AJNA CLI —— 얼굴(ajna) · 몸(ajna-host) · 세션 에이전트(ajna-remote)가 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.74"

  url "https://dl.ajna.systems/cli/0.0.74/ajna-0.0.74-linux-x86_64.tar.gz"
  sha256 "a24a7513f2c38b433078fab2fdf774ee327b8d43a7f08b42bb3f2f0148a64bec"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.74/ajna-0.0.74-darwin-arm64.tar.gz"
      sha256 "d286d77b8a7d9cfe34c9f4dca5768e3f241dbbce6105bf3cce331a1e2de76219"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.74/ajna-0.0.74-darwin-x86_64.tar.gz"
      sha256 "dad15c2cf90189f372259c87dfdbc0b3964f8e079a9eaa2d074a3d748b9ddba7"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.74/ajna-0.0.74-linux-x86_64.tar.gz"
      sha256 "a24a7513f2c38b433078fab2fdf774ee327b8d43a7f08b42bb3f2f0148a64bec"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
