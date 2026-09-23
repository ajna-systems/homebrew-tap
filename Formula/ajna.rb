# AJNA CLI —— 얼굴(ajna)과 몸(ajna-host)이 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.34"

  url "https://dl.ajna.systems/cli/0.0.34/ajna-0.0.34-linux-x86_64.tar.gz"
  sha256 "6e1eabe3bd572552bc3146273a0fecc68e4d45d2576e474c12db1818093a3304"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.34/ajna-0.0.34-darwin-arm64.tar.gz"
      sha256 "121c8a1f587ae6789069d23490caf32548cf937102fe86da48df62afc1eed059"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.34/ajna-0.0.34-darwin-x86_64.tar.gz"
      sha256 "0e772876d6fb594ff53acd61fd46ecabca4c701ba826a94a08a12d50de3d14f4"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.34/ajna-0.0.34-linux-x86_64.tar.gz"
      sha256 "6e1eabe3bd572552bc3146273a0fecc68e4d45d2576e474c12db1818093a3304"
    end
  end

  def install
    bin.install "ajna", "ajna-host"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
