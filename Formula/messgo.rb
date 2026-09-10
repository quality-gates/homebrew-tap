class Messgo < Formula
  desc "PHP Mess Detector port for Go"
  homepage "https://github.com/quality-gates/messgo"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messgo/releases/download/v0.4.3/messgo_0.4.3_darwin_arm64.tar.gz?version=0.4.3"
      sha256 "ba07eb4d819b7176a8116cf04be045c6a2f0aa8c1bfb02c9145f13ce73becdd0"
    end

    on_intel do
      url "https://github.com/quality-gates/messgo/releases/download/v0.4.3/messgo_0.4.3_darwin_amd64.tar.gz?version=0.4.3"
      sha256 "f83c5d8adf1d8ef90d8d788ee1e892d27ea7bbfac0a4ecd14b5fb91a004c574c"
    end
  end

  def install
    bin.install "messgo"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.4.3", shell_output("#{bin}/messgo --version")
  end
end
