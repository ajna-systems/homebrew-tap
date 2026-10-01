# AJNA CLI —— 얼굴(ajna) · 몸(ajna-host) · 세션 에이전트(ajna-remote)가 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.77"

  url "https://dl.ajna.systems/cli/0.0.77/ajna-0.0.77-linux-x86_64.tar.gz"
  sha256 "67ab25a24e8406a2d5d1615456f908828802e3e02d82dbb36e9d1bb2027d198d"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.77/ajna-0.0.77-darwin-arm64.tar.gz"
      sha256 "4df334e813f2b72936f9cb3e82b48ec9f4f4df3cda8ffb52708b57f1a6b4c357"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.77/ajna-0.0.77-darwin-x86_64.tar.gz"
      sha256 "a76715e4e1522f7751172d036f377b27554f243ee9605cacb22e80f430eda826"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.77/ajna-0.0.77-linux-x86_64.tar.gz"
      sha256 "67ab25a24e8406a2d5d1615456f908828802e3e02d82dbb36e9d1bb2027d198d"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
