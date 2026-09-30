# AJNA CLI —— 얼굴(ajna) · 몸(ajna-host) · 세션 에이전트(ajna-remote)가 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.72"

  url "https://dl.ajna.systems/cli/0.0.72/ajna-0.0.72-linux-x86_64.tar.gz"
  sha256 "d4b1fa9b9368685586b2bb246cf3b9237ab637bdb08905acbeca6c87d03593fd"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.72/ajna-0.0.72-darwin-arm64.tar.gz"
      sha256 "d75670342370dbfe6dbee7ac65b268799b5729ea926eae247c7b3b035028066c"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.72/ajna-0.0.72-darwin-x86_64.tar.gz"
      sha256 "2c3a9bb01ff7d75167b7cb8259f6ae527bf07b4b3c052d55ed8b9ff272e37165"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.72/ajna-0.0.72-linux-x86_64.tar.gz"
      sha256 "d4b1fa9b9368685586b2bb246cf3b9237ab637bdb08905acbeca6c87d03593fd"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
