# AJNA CLI —— 얼굴(ajna)과 몸(ajna-host)이 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.40"

  url "https://dl.ajna.systems/cli/0.0.40/ajna-0.0.40-linux-x86_64.tar.gz"
  sha256 "aa14d36401d5abb631b4859467fd2a9ce62499095b9d84d105dbc39d7264d1c5"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.40/ajna-0.0.40-darwin-arm64.tar.gz"
      sha256 "015916bab004e7f6f4116ed78f205b6b6a80973bbb7557da75b913f5ef7e361a"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.40/ajna-0.0.40-darwin-x86_64.tar.gz"
      sha256 "592bdc6e2aeb0f42f3b4c4536ced075c29fcd06c83f830c3666e1f93e5bf8de7"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.40/ajna-0.0.40-linux-x86_64.tar.gz"
      sha256 "aa14d36401d5abb631b4859467fd2a9ce62499095b9d84d105dbc39d7264d1c5"
    end
  end

  def install
    bin.install "ajna", "ajna-host"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
