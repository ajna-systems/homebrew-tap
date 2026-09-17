# AJNA CLI —— 얼굴(ajna)과 몸(ajna-host)이 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.19"

  url "https://dl.ajna.systems/cli/0.0.19/ajna-0.0.19-linux-x86_64.tar.gz"
  sha256 "7b90d2d67c4f4f33810173b9e602bccf6fe630fc835dfddddb9d7cdc71f54594"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.19/ajna-0.0.19-darwin-arm64.tar.gz"
      sha256 "1de1a318017f9d9dba242ce7b35ab7aa17c3e80b71aa0ab89e9d955c25fca657"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.19/ajna-0.0.19-darwin-x86_64.tar.gz"
      sha256 "dcfc2772d3e8bc17d9e524c11167e05788a335a5aa0811035d14059ab78e980b"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.19/ajna-0.0.19-linux-x86_64.tar.gz"
      sha256 "7b90d2d67c4f4f33810173b9e602bccf6fe630fc835dfddddb9d7cdc71f54594"
    end
  end

  def install
    bin.install "ajna", "ajna-host"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
