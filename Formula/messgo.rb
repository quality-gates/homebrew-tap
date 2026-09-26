class Messgo < Formula
  desc "PHP Mess Detector port for Go"
  homepage "https://github.com/quality-gates/messgo"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messgo/releases/download/v0.5.3/messgo_0.5.3_darwin_arm64.tar.gz?version=0.5.3"
      sha256 "2ec779ac6e53619f20ed3504145c95aeb8f76735c35732aa107bcb6df847c3b4"
    end

    on_intel do
      url "https://github.com/quality-gates/messgo/releases/download/v0.5.3/messgo_0.5.3_darwin_amd64.tar.gz?version=0.5.3"
      sha256 "a78ca6d7f8c23fadbd908ab8f5584455dcbb83ee0a55cdfd6d7218e698737d9f"
    end
  end

  def install
    bin.install "messgo"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.5.3", shell_output("#{bin}/messgo --version")
  end
end
