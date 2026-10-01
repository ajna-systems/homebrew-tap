# AJNA CLI —— 얼굴(ajna) · 몸(ajna-host) · 세션 에이전트(ajna-remote)가 한 꾸러미에 있다. 판은 늘 같이 간다.
# 판마다 필름(run/publish/steps/step_20_tap.sh)이 다시 쓴다. 손으로 고치지 않는다.
# 뿌리의 url 은 아래 on_* 가 덮지 않는 자리(linux-arm64)의 몫이고, 그 자리는 depends_on 이 문을 닫는다.
class Ajna < Formula
  desc "AJNA CLI and core-host"
  homepage "https://ajna.systems"
  version "0.0.79"

  url "https://dl.ajna.systems/cli/0.0.79/ajna-0.0.79-linux-x86_64.tar.gz"
  sha256 "4b2fddf115f9c74fe00b520f6fb9815c8782c38dd9dfe66430b6f10b81c4aeff"

  on_macos do
    on_arm do
      url "https://dl.ajna.systems/cli/0.0.79/ajna-0.0.79-darwin-arm64.tar.gz"
      sha256 "84926c0f01ddc4b4fae1a9080a735f8ce1e3ec6ed319a5ed21d770355d0df768"
    end
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.79/ajna-0.0.79-darwin-x86_64.tar.gz"
      sha256 "6e8818507452b221bed517d228eb55b747ae017e96be2b3bd7daf91ea023f0c5"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://dl.ajna.systems/cli/0.0.79/ajna-0.0.79-linux-x86_64.tar.gz"
      sha256 "4b2fddf115f9c74fe00b520f6fb9815c8782c38dd9dfe66430b6f10b81c4aeff"
    end
  end

  def install
    bin.install "ajna", "ajna-host", "ajna-remote"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajna --version")
  end
end
