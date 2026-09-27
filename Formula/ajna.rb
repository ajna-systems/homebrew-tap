# AJNA CLI —— 얼굴(ajna)과 몸(ajna-host)이 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.41"

  url "https://dl.ajna.systems/cli/0.0.41/ajna-0.0.41-linux-x86_64.tar.gz"
  sha256 "34427200a1aa2e42669c5543287c369681fb97e158790515d7c0d48553d38129"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.41/ajna-0.0.41-darwin-arm64.tar.gz"
      sha256 "db6595d744d179f834a53489b67cfa66832b4448dd73353cf9252f93088cb672"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.41/ajna-0.0.41-darwin-x86_64.tar.gz"
      sha256 "02e9ed46c2b1516b806d71bda4666a7566a3e914b72f70e8ab7dfb53d261745b"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.41/ajna-0.0.41-linux-x86_64.tar.gz"
      sha256 "34427200a1aa2e42669c5543287c369681fb97e158790515d7c0d48553d38129"
    end
  end

  def install
    bin.install "ajna", "ajna-host"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
