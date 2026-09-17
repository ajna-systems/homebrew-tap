# AJNA CLI —— 얼굴(ajna)과 몸(ajna-host)이 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.16"

  url "https://dl.ajna.systems/cli/0.0.16/ajna-0.0.16-linux-x86_64.tar.gz"
  sha256 "f404e97ac508b24eb11e6c05dd174d0d5b6426b8e5a2cfde7ad70c3a3a4d975c"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.16/ajna-0.0.16-darwin-arm64.tar.gz"
      sha256 "c459c2d0109749d28c64e2a0cd99af103ebe4b84ca924f488671da961d7e0f53"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.16/ajna-0.0.16-darwin-x86_64.tar.gz"
      sha256 "01446a9867bbb759f560773304ed7f76d37ccf6dcbef63ed71bfe38728aba7cd"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.16/ajna-0.0.16-linux-x86_64.tar.gz"
      sha256 "f404e97ac508b24eb11e6c05dd174d0d5b6426b8e5a2cfde7ad70c3a3a4d975c"
    end
  end

  def install
    bin.install "ajna", "ajna-host"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
