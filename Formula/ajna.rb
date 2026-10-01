# AJNA CLI —— 얼굴(ajna) · 몸(ajna-host) · 세션 에이전트(ajna-remote)가 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.78"

  url "https://dl.ajna.systems/cli/0.0.78/ajna-0.0.78-linux-x86_64.tar.gz"
  sha256 "f2d2f30d20aa7c775f768756b33fead054789bfb5ef098a9410fcfea75f33f1e"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.78/ajna-0.0.78-darwin-arm64.tar.gz"
      sha256 "5dd81b96a13ebfc01591a03cb63296472b87ae470e647e6fac861c325e529f40"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.78/ajna-0.0.78-darwin-x86_64.tar.gz"
      sha256 "8912dc6b884b8fff97af658e68cbb08e45a8e6704d00d06b272b4f8ebcc314f0"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.78/ajna-0.0.78-linux-x86_64.tar.gz"
      sha256 "f2d2f30d20aa7c775f768756b33fead054789bfb5ef098a9410fcfea75f33f1e"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
