# AJNA CLI —— 얼굴(ajna)과 몸(ajna-host)이 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.18"

  url "https://dl.ajna.systems/cli/0.0.18/ajna-0.0.18-linux-x86_64.tar.gz"
  sha256 "69204adfdad6a46666ace47a053909999b4d3526d43e6d20be8f29574310ee5e"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.18/ajna-0.0.18-darwin-arm64.tar.gz"
      sha256 "a59a9b6583e3bf56e028b7465ce6d2816fd8c4c442a4e355e21f01502308b6fd"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.18/ajna-0.0.18-darwin-x86_64.tar.gz"
      sha256 "7f669b3bba518939d40eb09663c227ef34f29a57c9c969eed0ff6c7adab68a4d"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.18/ajna-0.0.18-linux-x86_64.tar.gz"
      sha256 "69204adfdad6a46666ace47a053909999b4d3526d43e6d20be8f29574310ee5e"
    end
  end

  def install
    bin.install "ajna", "ajna-host"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
