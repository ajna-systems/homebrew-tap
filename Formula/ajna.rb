# AJNA CLI —— 얼굴(ajna) · 몸(ajna-host) · 세션 에이전트(ajna-remote)가 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.64"

  url "https://dl.ajna.systems/cli/0.0.64/ajna-0.0.64-linux-x86_64.tar.gz"
  sha256 "06ffe84670a5fda60f74fc425e443bda6faad154af1240334f2f8dc6d2b637fa"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.64/ajna-0.0.64-darwin-arm64.tar.gz"
      sha256 "69a8b4289f75985cc63a1b8e22988389b0c4593fe685d3385997e3ea1808dddf"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.64/ajna-0.0.64-darwin-x86_64.tar.gz"
      sha256 "5f354df5437e14f8921853b79882d9e3df8485693ac3391c1e1cd5a2ababa60e"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.64/ajna-0.0.64-linux-x86_64.tar.gz"
      sha256 "06ffe84670a5fda60f74fc425e443bda6faad154af1240334f2f8dc6d2b637fa"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
