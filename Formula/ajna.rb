# AJNA CLI —— 얼굴(ajna) · 몸(ajna-host) · 세션 에이전트(ajna-remote)가 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.45"

  url "https://dl.ajna.systems/cli/0.0.45/ajna-0.0.45-linux-x86_64.tar.gz"
  sha256 "b5df0dda2420aee33a23aeb48ccf15f847d3491330954c257b2355b12c2ee2a9"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.45/ajna-0.0.45-darwin-arm64.tar.gz"
      sha256 "c6b42926c55342f4133f54cd2b6dc0edd18bec43f955f6442ca8b31e2b5c9481"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.45/ajna-0.0.45-darwin-x86_64.tar.gz"
      sha256 "040e4c0c7259210056b646e1e59d26cba4dba53a8728fd370f58516dae285697"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.45/ajna-0.0.45-linux-x86_64.tar.gz"
      sha256 "b5df0dda2420aee33a23aeb48ccf15f847d3491330954c257b2355b12c2ee2a9"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
