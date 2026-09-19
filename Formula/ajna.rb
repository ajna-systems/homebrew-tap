# AJNA CLI —— 얼굴(ajna)과 몸(ajna-host)이 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.29"

  url "https://dl.ajna.systems/cli/0.0.29/ajna-0.0.29-linux-x86_64.tar.gz"
  sha256 "ef270bed091e5c948b582cdd349262f1e401ea17926f85376c4e21f01911644c"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.29/ajna-0.0.29-darwin-arm64.tar.gz"
      sha256 "ca12d6752ffec434862d342af43c4a2536e73657c3db9bb00b85c5579cb37831"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.29/ajna-0.0.29-darwin-x86_64.tar.gz"
      sha256 "ec3d61f4504a29dd3f706f5d774977676806a0a5795080d909549937fd7813b0"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.29/ajna-0.0.29-linux-x86_64.tar.gz"
      sha256 "ef270bed091e5c948b582cdd349262f1e401ea17926f85376c4e21f01911644c"
    end
  end

  def install
    bin.install "ajna", "ajna-host"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
