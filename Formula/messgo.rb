class Messgo < Formula
  desc "PHP Mess Detector port for Go"
  homepage "https://github.com/quality-gates/messgo"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messgo/releases/download/v0.5.11/messgo_0.5.11_darwin_arm64.tar.gz?version=0.5.11"
      sha256 "575bbace1f537d838f9c4daf2cec38dfa740a3b72080b5ca9c3c83a6dc39fce6"
    end

    on_intel do
      url "https://github.com/quality-gates/messgo/releases/download/v0.5.11/messgo_0.5.11_darwin_amd64.tar.gz?version=0.5.11"
      sha256 "e94ee76d00db90e07b5f371d6356b08a9f6a9c741d5aa8ecb389afe9e3bf6737"
    end
  end

  def install
    bin.install "messgo"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.5.11", shell_output("#{bin}/messgo --version")
  end
end
