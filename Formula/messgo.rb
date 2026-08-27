class Messgo < Formula
  desc "PHP Mess Detector port for Go"
  homepage "https://github.com/quality-gates/messgo"
  version "0.2.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messgo/releases/download/v0.2.2/messgo_0.2.2_darwin_arm64.tar.gz"
      sha256 "4147aca448bbb2190f84b39527d03371e5b92e1d8a6e3f217d6c37f4229cb16e"
    end

    on_intel do
      url "https://github.com/quality-gates/messgo/releases/download/v0.2.2/messgo_0.2.2_darwin_amd64.tar.gz"
      sha256 "9dbebed149d9af7468b2fba476c3a3df6db09a6070fc61bdd80b1296427ec9b4"
    end
  end

  def install
    bin.install "messgo"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.2.2", shell_output("#{bin}/messgo --version")
  end
end
