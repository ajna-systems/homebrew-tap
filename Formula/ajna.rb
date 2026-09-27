# AJNA CLI —— 얼굴(ajna) · 몸(ajna-host) · 세션 에이전트(ajna-remote)가 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.50"

  url "https://dl.ajna.systems/cli/0.0.50/ajna-0.0.50-linux-x86_64.tar.gz"
  sha256 "75c069de51649204d69c9fff9019f33e77c28fea39fc921242feefbfc6e7aa11"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.50/ajna-0.0.50-darwin-arm64.tar.gz"
      sha256 "c337435adfd75c02c4ba6f7a72009f027b69476c5343baaf3734da41055e190f"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.50/ajna-0.0.50-darwin-x86_64.tar.gz"
      sha256 "8234d15ba6dfa5f38d9846f564533865d8757fe946a0961cb0f9ea18a9837616"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.50/ajna-0.0.50-linux-x86_64.tar.gz"
      sha256 "75c069de51649204d69c9fff9019f33e77c28fea39fc921242feefbfc6e7aa11"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
