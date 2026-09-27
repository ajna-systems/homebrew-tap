# AJNA CLI —— 얼굴(ajna) · 몸(ajna-host) · 세션 에이전트(ajna-remote)가 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.52"

  url "https://dl.ajna.systems/cli/0.0.52/ajna-0.0.52-linux-x86_64.tar.gz"
  sha256 "a1f8b4eb8c7fa4481c4a365f10f634b786101a258537539c9a7a22fb32bff3b0"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.52/ajna-0.0.52-darwin-arm64.tar.gz"
      sha256 "24ea09b75581e0df7dad6365272436b265657c167daee3cf8c564783e947b5a9"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.52/ajna-0.0.52-darwin-x86_64.tar.gz"
      sha256 "7b64829abe925c5ab7bb85965a037a9374da3145ee25087e0e468c6dd27f0a87"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.52/ajna-0.0.52-linux-x86_64.tar.gz"
      sha256 "a1f8b4eb8c7fa4481c4a365f10f634b786101a258537539c9a7a22fb32bff3b0"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
