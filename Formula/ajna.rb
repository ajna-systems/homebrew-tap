# AJNA CLI —— 얼굴(ajna)과 몸(ajna-host)이 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.39"

  url "https://dl.ajna.systems/cli/0.0.39/ajna-0.0.39-linux-x86_64.tar.gz"
  sha256 "6f7002826a9b8084f1b5a737706144d4e96d3133ec766696925144504034c0c6"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.39/ajna-0.0.39-darwin-arm64.tar.gz"
      sha256 "9a158c3240ad56b5f07d7429265d1dd6ffa0dd40d615a9bfc8cd35c8623e5f12"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.39/ajna-0.0.39-darwin-x86_64.tar.gz"
      sha256 "ee3973d5ad2a2f43a18cb37c01eb8420039e722f1a2d623fd76f3b8ce7ee0704"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.39/ajna-0.0.39-linux-x86_64.tar.gz"
      sha256 "6f7002826a9b8084f1b5a737706144d4e96d3133ec766696925144504034c0c6"
    end
  end

  def install
    bin.install "ajna", "ajna-host"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
