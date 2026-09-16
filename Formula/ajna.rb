# AJNA CLI —— 얼굴(ajna)과 몸(ajna-host)이 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.14"

  url "https://dl.ajna.systems/cli/0.0.14/ajna-0.0.14-linux-x86_64.tar.gz"
  sha256 "58d531503327ef8b5becac6a7d5ba96c86225b90c8f5d111160834a12d638820"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.14/ajna-0.0.14-darwin-arm64.tar.gz"
      sha256 "aebf5bbf51cdc3ba472d5a856b15df31091026d9ef7bddf885cc0e4a502ea116"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.14/ajna-0.0.14-darwin-x86_64.tar.gz"
      sha256 "619450ae605bd373147c361f4a005671144dce61d4894228484b13711c6dca62"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.14/ajna-0.0.14-linux-x86_64.tar.gz"
      sha256 "58d531503327ef8b5becac6a7d5ba96c86225b90c8f5d111160834a12d638820"
    end
  end

  def install
    bin.install "ajna", "ajna-host"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
