# AJNA CLI —— 얼굴(ajna)과 몸(ajna-host)이 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.43"

  url "https://dl.ajna.systems/cli/0.0.43/ajna-0.0.43-linux-x86_64.tar.gz"
  sha256 "773a77b7454d16b5c22a6748ce9a8bd50a62422095c7a4d332290e5b4aa98fe2"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.43/ajna-0.0.43-darwin-arm64.tar.gz"
      sha256 "e2c88aa564febbc5312a0955dfec7ad31a0e1352d925e96cc14c3722237b748b"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.43/ajna-0.0.43-darwin-x86_64.tar.gz"
      sha256 "9032d7a585c27e6d7aa32d3e14623c060215369663f143e7c34167e3a8805529"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.43/ajna-0.0.43-linux-x86_64.tar.gz"
      sha256 "773a77b7454d16b5c22a6748ce9a8bd50a62422095c7a4d332290e5b4aa98fe2"
    end
  end

  def install
    bin.install "ajna", "ajna-host"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
