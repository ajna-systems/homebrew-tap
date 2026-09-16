# AJNA CLI —— 얼굴(ajna)과 몸(ajna-host)이 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.12"

  url "https://dl.ajna.systems/cli/0.0.12/ajna-0.0.12-linux-x86_64.tar.gz"
  sha256 "ef2e4784a1be40cd63be8cfceeddbe860bdf123ca8c285b4fe5ad7bd7325cb70"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.12/ajna-0.0.12-darwin-arm64.tar.gz"
      sha256 "2f2d16d9426678e267be52d3da7421e886d3d7fc60655e4b3fd1787c458a9e4f"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.12/ajna-0.0.12-darwin-x86_64.tar.gz"
      sha256 "38243f0de1497cf2eb4b0397c93617e32225d26a382e0a5500d65553a826fbc2"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.12/ajna-0.0.12-linux-x86_64.tar.gz"
      sha256 "ef2e4784a1be40cd63be8cfceeddbe860bdf123ca8c285b4fe5ad7bd7325cb70"
    end
  end

  def install
    bin.install "ajna", "ajna-host"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
