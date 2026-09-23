class Messgo < Formula
  desc "PHP Mess Detector port for Go"
  homepage "https://github.com/quality-gates/messgo"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messgo/releases/download/v0.5.0/messgo_0.5.0_darwin_arm64.tar.gz?version=0.5.0"
      sha256 "3862250966f1ef753cf38e36c1b9c90f702798b137128c0ab5cb3d6b56bb702c"
    end

    on_intel do
      url "https://github.com/quality-gates/messgo/releases/download/v0.5.0/messgo_0.5.0_darwin_amd64.tar.gz?version=0.5.0"
      sha256 "61731f853267dc6d2fec0ffe807fec52a2ccc304113442c7aaea0f903eaafeaf"
    end
  end

  def install
    bin.install "messgo"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.5.0", shell_output("#{bin}/messgo --version")
  end
end
