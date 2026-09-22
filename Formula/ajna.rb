# AJNA CLI —— 얼굴(ajna)과 몸(ajna-host)이 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.32"

  url "https://dl.ajna.systems/cli/0.0.32/ajna-0.0.32-linux-x86_64.tar.gz"
  sha256 "1bc6c45984d1e5b09db1f7d59f2513e7af2c14e7920c9c0622c0d1f68b554024"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.32/ajna-0.0.32-darwin-arm64.tar.gz"
      sha256 "41927cfb5319823790b3732c99fcb6e1d660a743298121e095a09602305c1795"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.32/ajna-0.0.32-darwin-x86_64.tar.gz"
      sha256 "81d41ef5011a610d2d15a3381c8b6cb34b913743591fc0d3b8c9b0095697392b"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.32/ajna-0.0.32-linux-x86_64.tar.gz"
      sha256 "1bc6c45984d1e5b09db1f7d59f2513e7af2c14e7920c9c0622c0d1f68b554024"
    end
  end

  def install
    bin.install "ajna", "ajna-host"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
