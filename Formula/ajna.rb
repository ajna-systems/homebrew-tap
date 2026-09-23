# AJNA CLI —— 얼굴(ajna)과 몸(ajna-host)이 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.36"

  url "https://dl.ajna.systems/cli/0.0.36/ajna-0.0.36-linux-x86_64.tar.gz"
  sha256 "df73ad8e85738e562e63fa36c3d3856d7f15ad97d027dbc5dc53791a6a99e2bd"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.36/ajna-0.0.36-darwin-arm64.tar.gz"
      sha256 "2db45df9039ccbab53bb366d9e3389225c4b0fabaccaf59939ee17270b6995f9"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.36/ajna-0.0.36-darwin-x86_64.tar.gz"
      sha256 "577bc14ade8c8efc1f1167446b8ec11e2abbd0ceb2df4ddae3bbb4f9ecdd3c50"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.36/ajna-0.0.36-linux-x86_64.tar.gz"
      sha256 "df73ad8e85738e562e63fa36c3d3856d7f15ad97d027dbc5dc53791a6a99e2bd"
    end
  end

  def install
    bin.install "ajna", "ajna-host"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
