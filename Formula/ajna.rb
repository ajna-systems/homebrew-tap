# AJNA CLI —— 얼굴(ajna)과 몸(ajna-host)이 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.38"

  url "https://dl.ajna.systems/cli/0.0.38/ajna-0.0.38-linux-x86_64.tar.gz"
  sha256 "be5fda283758d35029a9b6d91b2c37fc4a9eab773c79ced5652efa6438929ae7"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.38/ajna-0.0.38-darwin-arm64.tar.gz"
      sha256 "b5a94a30e3d08d2ff41806d30984764b5a0d01ea6e0e96525da90a903fad232b"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.38/ajna-0.0.38-darwin-x86_64.tar.gz"
      sha256 "6608ab9216e2844a60928a3017f096939424ee7aa8547c1d286210ed163d925c"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.38/ajna-0.0.38-linux-x86_64.tar.gz"
      sha256 "be5fda283758d35029a9b6d91b2c37fc4a9eab773c79ced5652efa6438929ae7"
    end
  end

  def install
    bin.install "ajna", "ajna-host"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
