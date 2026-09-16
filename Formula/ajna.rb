# AJNA CLI —— 얼굴(ajna)과 몸(ajna-host)이 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.7"

  url "https://dl.ajna.systems/cli/0.0.7/ajna-0.0.7-linux-x86_64.tar.gz"
  sha256 "15ee18734877c5ab59846099bf30959fbc68a073781f0d835ba134438e6643ce"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.7/ajna-0.0.7-darwin-arm64.tar.gz"
      sha256 "768f5e57fc90bd34292317c95b66fab12fe0b62afb4a2e6bb44b0ae08f286435"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.7/ajna-0.0.7-darwin-x86_64.tar.gz"
      sha256 "c0362425d7bfbf389dc04e6600fd38bf5e2ad7542d5f70d31161134d32d1a44d"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.7/ajna-0.0.7-linux-x86_64.tar.gz"
      sha256 "15ee18734877c5ab59846099bf30959fbc68a073781f0d835ba134438e6643ce"
    end
  end

  def install
    bin.install "ajna", "ajna-host"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
