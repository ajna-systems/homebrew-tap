# AJNA CLI —— 얼굴(ajna)과 몸(ajna-host)이 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.24"

  url "https://dl.ajna.systems/cli/0.0.24/ajna-0.0.24-linux-x86_64.tar.gz"
  sha256 "71d96e883535532834befff1b6a74782b774b7ed6a5144e1f29b85ef6b6c9302"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.24/ajna-0.0.24-darwin-arm64.tar.gz"
      sha256 "58a0c8cac42364f15fde7a16ce974908afb1b441076e56be9de7c84ed45c1648"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.24/ajna-0.0.24-darwin-x86_64.tar.gz"
      sha256 "17cae138e24eaeb6f6b30e0534b22c9408a3a16d66182e7232b188c970b3e114"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.24/ajna-0.0.24-linux-x86_64.tar.gz"
      sha256 "71d96e883535532834befff1b6a74782b774b7ed6a5144e1f29b85ef6b6c9302"
    end
  end

  def install
    bin.install "ajna", "ajna-host"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
