# AJNA CLI —— 얼굴(ajna)과 몸(ajna-host)이 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.42"

  url "https://dl.ajna.systems/cli/0.0.42/ajna-0.0.42-linux-x86_64.tar.gz"
  sha256 "e3e01d8a0d6e354f795096322b1d8203a0b716cf2581202d4226c6a28da545cc"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.42/ajna-0.0.42-darwin-arm64.tar.gz"
      sha256 "10b524a4b6b65bfba833ca10440fc7ecd55690d5b18eb3b2a7463c2ec99bdfb1"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.42/ajna-0.0.42-darwin-x86_64.tar.gz"
      sha256 "fcf41083e374f8a6684f7066eb98179aa2733927b60dc37dcd35a4038f6d54d0"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.42/ajna-0.0.42-linux-x86_64.tar.gz"
      sha256 "e3e01d8a0d6e354f795096322b1d8203a0b716cf2581202d4226c6a28da545cc"
    end
  end

  def install
    bin.install "ajna", "ajna-host"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
