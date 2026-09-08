class Messgo < Formula
  desc "PHP Mess Detector port for Go"
  homepage "https://github.com/quality-gates/messgo"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messgo/releases/download/v0.4.2/messgo_0.4.2_darwin_arm64.tar.gz?version=0.4.2"
      sha256 "430bde6cdd9f8d0348a52a10a4143d0c66bfa7775b3856f04c116fee372afad8"
    end

    on_intel do
      url "https://github.com/quality-gates/messgo/releases/download/v0.4.2/messgo_0.4.2_darwin_amd64.tar.gz?version=0.4.2"
      sha256 "2ef1e8cb211b7cf0caf79dcaacd1fb73e0b08853d849a6d4c854e9ada371de78"
    end
  end

  def install
    bin.install "messgo"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.4.2", shell_output("#{bin}/messgo --version")
  end
end
