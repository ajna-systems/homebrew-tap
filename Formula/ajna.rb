# AJNA CLI —— 얼굴(ajna)과 몸(ajna-host)이 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.27"

  url "https://dl.ajna.systems/cli/0.0.27/ajna-0.0.27-linux-x86_64.tar.gz"
  sha256 "f6b279a195b8ebbefa01d2d79fc7c208fb208517e6c3a6e1933fba4f2f8631f7"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.27/ajna-0.0.27-darwin-arm64.tar.gz"
      sha256 "1d5ec00dc56cf674f8e7622166b0cb382866a72cb3d0d76b6e7b6f5287dd6837"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.27/ajna-0.0.27-darwin-x86_64.tar.gz"
      sha256 "c63aee5e47dfaf87dffae7c10d643ca64fda39e0c7ea7e52a332766d4a8456eb"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.27/ajna-0.0.27-linux-x86_64.tar.gz"
      sha256 "f6b279a195b8ebbefa01d2d79fc7c208fb208517e6c3a6e1933fba4f2f8631f7"
    end
  end

  def install
    bin.install "ajna", "ajna-host"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
