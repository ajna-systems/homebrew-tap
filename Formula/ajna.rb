# AJNA CLI —— 얼굴(ajna)과 몸(ajna-host)이 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(step_90_publish)이 다시 쓴다. 정본은 https://dl.ajna.systems/cli/ajna.rb 이고
# 이 파일은 그 판(0.0.3)의 사본이다. 손으로 고치지 않는다.
# Homebrew 는 tap 밖의 formula 를 안 받는다 —— tap 자리가 설 때까지 이것은 자국일 뿐이다(원장 C-13).
# 재어 본 길: brew tap-new ajna-systems/tap → Formula/ajna.rb 로 넣고
#             brew install ajna-systems/tap/ajna → 0.0.3 가 섰다(2026-09-16).
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.3"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.3/ajna-0.0.3-darwin-arm64.tar.gz"
      sha256 "99b7b31a6b477109cb13bf05f640fb1f27ed27277c2b8ba77b21e795f4cee8f3"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.3/ajna-0.0.3-darwin-x86_64.tar.gz"
      sha256 "f58350c0c04b3d003c4fcc604a2b9beaf8207ff43ed6a355d0a995338d8b257d"
    end
  end

  on_linux do
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.3/ajna-0.0.3-linux-x86_64.tar.gz"
      sha256 "dc36a296516e4364ff41adcd20e050d3954541f1c37e9035b488b26712351226"
    end
  end

  def install
    bin.install "ajna", "ajna-host"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
