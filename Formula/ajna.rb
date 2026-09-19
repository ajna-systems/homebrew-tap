# AJNA CLI —— 얼굴(ajna)과 몸(ajna-host)이 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.25"

  url "https://dl.ajna.systems/cli/0.0.25/ajna-0.0.25-linux-x86_64.tar.gz"
  sha256 "42462df54b7ef9861ca5480046d43f6eef6edeb920b087bf97ffc62943f0ba94"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.25/ajna-0.0.25-darwin-arm64.tar.gz"
      sha256 "e1689a8b5bb8bd3db02d04d5c4769880cf6343a2a875ce28e219df3f509d6457"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.25/ajna-0.0.25-darwin-x86_64.tar.gz"
      sha256 "3f2f2cd008bf8c8773d182e576434619d55e9aac2fd37f169cf7ea5705096ea5"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.25/ajna-0.0.25-linux-x86_64.tar.gz"
      sha256 "42462df54b7ef9861ca5480046d43f6eef6edeb920b087bf97ffc62943f0ba94"
    end
  end

  def install
    bin.install "ajna", "ajna-host"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
