# AJNA CLI —— 얼굴(ajna) · 몸(ajna-host) · 세션 에이전트(ajna-remote)가 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.75"

  url "https://dl.ajna.systems/cli/0.0.75/ajna-0.0.75-linux-x86_64.tar.gz"
  sha256 "54851ed8204d5d8e51c932f55f3af757e9a12b9057c2f540c4cc0d2605cae53b"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.75/ajna-0.0.75-darwin-arm64.tar.gz"
      sha256 "e8369691fb88d86369b9e95c6a8aa1173918520ece3c2641c74fd60ab44b4b5d"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.75/ajna-0.0.75-darwin-x86_64.tar.gz"
      sha256 "d8ebcc5a43c083988b41e7e3334f0bc449804386620973e56dc97c039edfd09b"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.75/ajna-0.0.75-linux-x86_64.tar.gz"
      sha256 "54851ed8204d5d8e51c932f55f3af757e9a12b9057c2f540c4cc0d2605cae53b"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
