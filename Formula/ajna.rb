# AJNA CLI —— 얼굴(ajna) · 몸(ajna-host) · 세션 에이전트(ajna-remote)가 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.47"

  url "https://dl.ajna.systems/cli/0.0.47/ajna-0.0.47-linux-x86_64.tar.gz"
  sha256 "ec5a2c81593b1fa36bfd9b0c11db7a95a17792009e48cc1d2c71da456a27fe0c"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.47/ajna-0.0.47-darwin-arm64.tar.gz"
      sha256 "abb0a60a4ddd454c18318ff4a1d360426a383e0408a4c6f5d36b2ed045e66e35"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.47/ajna-0.0.47-darwin-x86_64.tar.gz"
      sha256 "7a850add60ebd9ce8de7d88040734b35745a83b142a38555f527d28cf6136e9c"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.47/ajna-0.0.47-linux-x86_64.tar.gz"
      sha256 "ec5a2c81593b1fa36bfd9b0c11db7a95a17792009e48cc1d2c71da456a27fe0c"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
