# AJNA CLI —— 얼굴(ajna)과 몸(ajna-host)이 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.37"

  url "https://dl.ajna.systems/cli/0.0.37/ajna-0.0.37-linux-x86_64.tar.gz"
  sha256 "01068a8237c68c5775955656159adf5419916bed533e19f778a842368e100df6"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.37/ajna-0.0.37-darwin-arm64.tar.gz"
      sha256 "1456d3e6201d953ce8a14271c65f5c77529c7c1aa9215e8450aeb3e42517faed"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.37/ajna-0.0.37-darwin-x86_64.tar.gz"
      sha256 "29fed74563947014d6e16ec646043b3112145695765908acc8cc0ef5e72f6e5e"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.37/ajna-0.0.37-linux-x86_64.tar.gz"
      sha256 "01068a8237c68c5775955656159adf5419916bed533e19f778a842368e100df6"
    end
  end

  def install
    bin.install "ajna", "ajna-host"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
