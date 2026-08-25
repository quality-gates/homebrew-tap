class Messgo < Formula
  desc "PHP Mess Detector port for Go"
  homepage "https://github.com/quality-gates/messgo"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messgo/releases/download/v0.2.1/messgo_0.2.1_darwin_arm64.tar.gz"
      sha256 "7ba30108df6328756cec20fd4bf409b3c1026f6964828952d6fd8eff7a3d9c97"
    end

    on_intel do
      url "https://github.com/quality-gates/messgo/releases/download/v0.2.1/messgo_0.2.1_darwin_amd64.tar.gz"
      sha256 "7c233445cb872bc268d9e25c76c7b1b909c02b145f3819b6e36a2e3d6a377605"
    end
  end

  def install
    bin.install "messgo"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.2.1", shell_output("#{bin}/messgo --version")
  end
end
