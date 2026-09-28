# AJNA CLI —— 얼굴(ajna) · 몸(ajna-host) · 세션 에이전트(ajna-remote)가 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.58"

  url "https://dl.ajna.systems/cli/0.0.58/ajna-0.0.58-linux-x86_64.tar.gz"
  sha256 "98a4922b98be193eaa058e4c9f9d746d5b4efbf64cd9a0a4eaa80e597da71109"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.58/ajna-0.0.58-darwin-arm64.tar.gz"
      sha256 "c8b73da5274ba78dce6fb141ea9209ee2155ae5eaf48106b95be993407e253e6"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.58/ajna-0.0.58-darwin-x86_64.tar.gz"
      sha256 "fc9dd9a88b7190cf9a87ebefdab3a6aefdf3c7a51aaa9ba744a0b4cc5d0691c9"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.58/ajna-0.0.58-linux-x86_64.tar.gz"
      sha256 "98a4922b98be193eaa058e4c9f9d746d5b4efbf64cd9a0a4eaa80e597da71109"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
