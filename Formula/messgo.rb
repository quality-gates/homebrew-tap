class Messgo < Formula
  desc "PHP Mess Detector port for Go"
  homepage "https://github.com/quality-gates/messgo"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messgo/releases/download/v0.5.6/messgo_0.5.6_darwin_arm64.tar.gz?version=0.5.6"
      sha256 "b6228147171db91c08b7edf8a7a370958947e8bedfa875654e6f1c185b377bce"
    end

    on_intel do
      url "https://github.com/quality-gates/messgo/releases/download/v0.5.6/messgo_0.5.6_darwin_amd64.tar.gz?version=0.5.6"
      sha256 "664a3317466d2164afce1a681528b55a3bafff04abbf680d95ecedd96fa3b1cb"
    end
  end

  def install
    bin.install "messgo"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.5.6", shell_output("#{bin}/messgo --version")
  end
end
